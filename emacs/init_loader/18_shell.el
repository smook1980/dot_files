;; Shell/Command utilities

;; compilation
(custom-set-variables
 '(compile-command "")
 '(compilation-always-kill t)
 '(compilation-message-face nil)
 '(compilation-auto-jump-to-first-error t))

(defun my/colorize-compilation-buffer ()
  (ansi-color-process-output nil))

(with-eval-after-load 'compile
  (add-hook 'compilation-filter-hook 'my/colorize-compilation-buffer))

;; eshell
(custom-set-variables
 '(eshell-banner-message "")
 '(eshell-cmpl-cycle-completions nil)
 '(eshell-hist-ignoredups t)
 '(eshell-scroll-show-maximum-output nil))

(defun my/eshell-mode-hook ()
  (define-key eshell-mode-map (kbd "M-r") 'helm-eshell-history))

(add-hook 'eshell-mode-hook 'my/eshell-mode-hook)
(global-set-key (kbd "C-\\") 'eshellutil-popup)
