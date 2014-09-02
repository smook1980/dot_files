;; shellscript mode
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode))

;; compilation
(custom-set-variables
 '(compilation-message-face nil))

(with-eval-after-load 'compile
  (set-face-attribute 'compilation-error nil :underline nil)
  (set-face-attribute 'compilation-line-number nil :underline t))

;; eshell
(with-eval-after-load 'em-prompt
  (set-face-attribute 'eshell-prompt nil
                      :foreground "yellow"))

(defun my/eshell-first-time-load-hook ()
  (define-key eshell-mode-map (kbd "M-r") 'helm-eshell-history)
  (setq eshell-first-time-p nil))
(add-hook 'eshell-first-time-mode-hook 'my/eshell-first-time-load-hook)

(custom-set-variables
 '(shell-pop-autocd-to-working-dir nil)
 '(shell-pop-shell-type '("eshell" " *eshell*" (lambda () (eshell))))
 '(shell-pop-universal-key "M-`")
 '(shell-pop-full-span t))
(global-set-key (kbd "M-`") 'shell-pop)

(defvar my/eshell-prev-buffer nil)
(defun my/shell-pop-up-hook ()
  (setq my/eshell-prev-buffer (current-buffer)))
(add-hook 'shell-pop-up-hook 'my/shell-pop-up-hook)

(defun eshell/cde ()
  (let* ((file-name (buffer-file-name my/eshell-prev-buffer))
         (dir (or (and file-name (file-name-directory file-name))
                  (and (eq major-mode 'dired-mode) dired-directory)
                  (with-current-buffer my/eshell-prev-buffer
                    default-directory))))
    (eshell/cd dir)))

(defun eshell/cdp ()
  (let ((dir (cl-loop with cwd = default-directory
                      for d in '(".git" ".hg" ".svn")
                      when (locate-dominating-file cwd d)
                      return (file-name-directory it))))
    (eshell/cd dir)))

(defun eshell/e (file)
  (let ((curwin (get-buffer-window))
        (filepath (concat default-directory file)))
    (other-window 1)
    (find-file filepath)
    (delete-window curwin)))
