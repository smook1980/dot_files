;; eldoc
(add-hook 'go-mode-hook 'go-eldoc-setup)

;;; helm-godoc
(dolist (func '(helm-godoc helm-godoc-at-point))
  (autoload func "helm-godoc" nil t))

(eval-after-load "go-mode"
  '(progn
     (require 'go-autocomplete)

     (define-key go-mode-map (kbd "C-c C-a") 'my/go-import-add)
     (define-key go-mode-map (kbd "C-c C-j") 'go-direx-pop-to-buffer)
     (define-key go-mode-map (kbd "C-c C-c") 'my/flycheck-list-errors)
     (define-key go-mode-map (kbd "C-c C-s") 'my/go-cleanup)
     (define-key go-mode-map (kbd "M-g M-t") 'my/go-test)
     (define-key go-mode-map (kbd "C-c C-t") 'my/go-toggle-test-file)
     (define-key go-mode-map (kbd "C-c C-d") 'helm-godoc)
     (define-key go-mode-map (kbd "C-c .") 'helm-godoc-at-point)
     (define-key go-mode-map (kbd "M-.") 'godef-jump)
     (define-key go-mode-map (kbd "M-,") 'pop-tag-mark)))

(defun my/go-mode-hook ()
  (setq flycheck-checker 'go-build))
(add-hook 'go-mode-hook 'my/go-mode-hook)

(defun my/go-toggle-test-file ()
  (interactive)
  (let ((file (buffer-file-name)))
    (unless file
      (error "Error: this buffer is not related to real file"))
    (let* ((basename (file-name-nondirectory file))
           (switched-file (if (string-match "_test" file)
                              (replace-regexp-in-string "_test" "" basename)
                            (replace-regexp-in-string "\\.go\\'" "_test.go" basename)))
           (find-func (if current-prefix-arg 'find-file-other-window 'find-file)))
      (funcall find-func switched-file))))

(defun my/go-cleanup ()
  (interactive)
  (save-buffer)
  (go-remove-unused-imports nil)
  (gofmt)
  (save-buffer))

(defun my/go-test ()
  (interactive)
  (let ((package (save-excursion
                   (goto-char (point-min))
                   (let ((regexp (concat "package\\s-+\\(" go-identifier-regexp "\\)")))
                     (if (re-search-forward regexp nil t)
                         (match-string-no-properties 1)
                       (error "Error: Can't find package name"))))))
    (let ((compilation-scroll-output t)
          (cmd (concat "go test " package)))
      (compile cmd))))

(defun my/go-import-add ()
  (interactive)
  (save-excursion
    (skip-chars-backward (concat go-identifier-regexp "\\."))
    (let ((symbol (thing-at-point 'symbol))
          (packages (go-packages)))
      (if (not symbol)
          (call-interactively 'go-import-add)
        (if (find-if (lambda (p) (string= symbol p)) packages)
            (go-import-add current-prefix-arg symbol)
          (let* ((re (concat (regexp-quote symbol) "\\'"))
                 (matched (loop for package in packages
                                when (and package (string-match-p re package))
                                collect pack)))
            (if (= (length matched) 1)
                (go-import-add current-prefix-arg (car matched))
              (call-interactively 'go-import-add))))))))
