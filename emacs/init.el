;; for lancher
(unless load-file-name
  (cd (getenv "HOME")))

(when load-file-name
  (setq-default user-emacs-directory (file-name-directory load-file-name)))

(load (concat user-emacs-directory "init-el-get.el"))

;; load environment variables
(let ((envs '("PATH" "VIRTUAL_ENV" "GOROOT" "GOPATH")))
  (exec-path-from-shell-copy-envs envs))

;;;; setup theme
(load-theme 'syohex t t)
(enable-theme 'syohex)

;; init-loader
(custom-set-variables
 '(init-loader-show-log-after-init 'error-only))
(init-loader-load (concat user-emacs-directory "init_loader"))
