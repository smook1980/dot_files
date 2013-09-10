;; python-setting
(defadvice run-python (around run-python-no-sit activate)
  "Suppress absurd sit-for in run-python of python.el"
  (let ((process-launched (or (ad-get-arg 2) ; corresponds to `new`
                              (not (comint-check-proc python-buffer)))))
    (flet ((sit-for (seconds &optional nodisp)
                    (when process-launched
                      (accept-process-output (get-buffer-process python-buffer)))))
      ad-do-it)))

(autoload 'helm-pydoc "helm-pydoc")

(eval-after-load "python"
  '(progn
     ;; binding
     (define-key python-mode-map (kbd "C-c C-a") 'helm-pydoc)
     (define-key python-mode-map (kbd "C-M-d") 'my/python-next-block)
     (define-key python-mode-map (kbd "C-M-u") 'my/python-up-block)
     (define-key python-mode-map (kbd "C-c C-z") 'run-python)
     (define-key python-mode-map (kbd "<backtab>") 'python-back-indent)))

(eval-after-load "jedi"
  '(progn
     ;; binding
     (define-key python-mode-map (kbd "C-c C-d") 'jedi:show-doc)
     (define-key python-mode-map (kbd "C-c C-l") 'jedi:get-in-function-call)

     ;; show-doc
     (setq jedi:tooltip-method nil)
     (set-face-attribute 'jedi:highlight-function-argument nil
                         :foreground "green")))

(defun my/python-mode-hook ()
  (jedi:ac-setup)

  ;; autopair
  (setq autopair-handle-action-fns
        '(autopair-default-handle-action autopair-python-triple-quote-action)))

(add-hook 'python-mode-hook 'my/python-mode-hook)
