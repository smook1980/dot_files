;;;; global key setting

;; my key mapping
(global-set-key (kbd "M-ESC ESC") 'keyboard-quit)
(global-set-key (kbd "M-,") 'pop-tag-mark)
(global-set-key (kbd "M-*") 'tags-loop-continue)
(global-set-key (kbd "M-[") 'backward-paragraph)
(global-set-key (kbd "M-]") 'forward-paragraph)
(global-set-key [delete] 'delete-char)
(global-set-key (kbd "C-h e") 'popwin:messages)
(global-set-key (kbd "C-M-l") 'goto-line)
(global-set-key (kbd "C-M-y") 'dired-jump-other-window)
(global-set-key (kbd "C-x ?") 'zeal-at-point)
(global-set-key (kbd "M-K") 'kill-whole-line)
(global-set-key (kbd "M-=") 'yas-insert-snippet)
(global-set-key (kbd "C-M-r") 'ace-jump-mode)
(global-set-key (kbd "C-M-c") 'ace-jump-char-mode)

;; helm binding
(global-set-key (kbd "M-.") 'helm-editutil-etags-select)
(global-set-key (kbd "C-M-z")   'helm-resume)
(global-set-key (kbd "C-x C-x") 'helm-find-files)
(global-set-key (kbd "C-x C-a") 'helm-editutil-git-ls-files)
(global-set-key (kbd "C-x C-r") 'helm-recentf)
(global-set-key (kbd "C-x C-l") 'helm-locate)
(global-set-key (kbd "C-x C-c") 'helm-M-x)
(global-set-key (kbd "M-y")     'helm-show-kill-ring)
(global-set-key (kbd "C-h a")   'helm-apropos)
(global-set-key (kbd "C-h m")   'helm-man-woman)
(global-set-key (kbd "C-x C-i") 'helm-imenu)
(global-set-key (kbd "C-x b")   'helm-buffers-list)

;; Ctrl-q map
(defvar my/ctrl-q-map (make-sparse-keymap)
  "My original keymap binded to C-q.")
(defalias 'my/ctrl-q-prefix my/ctrl-q-map)
(define-key global-map (kbd "C-q") 'my/ctrl-q-prefix)
(define-key my/ctrl-q-map (kbd "C-q") 'quoted-insert)

;; col-highlight
(define-key my/ctrl-q-map (kbd "C-c") 'column-highlight-mode)

(define-key my/ctrl-q-map (kbd "C-a") 'text-scale-adjust)
(define-key my/ctrl-q-map (kbd "C-f") 'flyspell-mode)
(define-key my/ctrl-q-map (kbd "C-m") 'my/toggle-flymake)
(define-key my/ctrl-q-map (kbd "C-t") 'toggle-cleanup-spaces)
(define-key my/ctrl-q-map (kbd "\\") 'align)
(define-key my/ctrl-q-map (kbd "SPC") 'mark-symbol)

(smartrep-define-key
    global-map "C-q" '(("-" . 'goto-last-change)
                       ("+" . 'goto-last-change-reverse)))

(smartrep-define-key
    global-map "C-c" '(("+" . 'evil-numbers/inc-at-pt)
                       ("-" . 'evil-numbers/dec-at-pt)))

;; editutil mappings
(editutil-default-setup)

;; M-g mapping
(global-set-key (kbd "M-g M-q") 'quickrun)
(global-set-key (kbd "M-g M-w") 'quickrun-with-arg)
(global-set-key (kbd "M-g M-r") 'compile)
(global-set-key (kbd "M-g RET") 'recompile)
(global-set-key (kbd "M-g .") 'helm-ag)
(global-set-key (kbd "M-g ,") 'helm-ag-pop-stack)
(global-set-key (kbd "M-g M-i") 'import-popwin)
(global-set-key (kbd "M-g M-f") 'ffap)
(global-set-key (kbd "M-g M-m") 'my/flymake-popup-error-message)
(global-set-key (kbd "M-g M-l") 'my/flycheck-list-errors)
(global-set-key (kbd "M-g s") 'helm-swoop)

;;; buffer-move
(global-set-key (kbd "M-g h") 'buf-move-left)
(global-set-key (kbd "M-g j") 'buf-move-down)
(global-set-key (kbd "M-g k") 'buf-move-up)
(global-set-key (kbd "M-g l") 'buf-move-right)
