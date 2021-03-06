;;;; Window configuration

;; popwin
(require 'popwin)
(global-set-key (kbd "M-z") popwin:keymap)
(global-set-key (kbd "C-x l") 'popwin:popup-last-buffer)
(global-set-key (kbd "C-x SPC") 'my/popwin:select-popup-window)

(defvar popwin:special-display-config-backup popwin:special-display-config)
(custom-set-variables
 '(display-buffer-function 'popwin:display-buffer))

(defun my/popwin:select-popup-window ()
  (interactive)
  (if (popwin:popup-window-live-p)
      (select-window popwin:popup-window)
    (popwin:popup-last-buffer)
    (select-window popwin:popup-window)))

;; remove from default config
(dolist (stuff '("*vc-diff*" "*vc-change-log*"))
  (delete stuff popwin:special-display-config))

;; basic
(push '("*Help*" :stick t :noselect t) popwin:special-display-config)

;; Ruby
(push '("*ri-doc*" :stick t :height 20) popwin:special-display-config)
(push '(inf-ruby-mode :stick t :height 20) popwin:special-display-config)

;; python
(push '("*Python*"   :stick t) popwin:special-display-config)
(push '("*Python Help*" :stick t :height 20) popwin:special-display-config)
(push '("*jedi:doc*" :stick t :noselect t) popwin:special-display-config)

;; direx
(push '(direx:direx-mode :position left :width 40 :dedicated t)
      popwin:special-display-config)

;; Go
(push '("^\*go-direx:" :position left :width 0.3 :dedicated t :stick t :regexp t)
      popwin:special-display-config)

;; flycheck
(push '(flycheck-error-list-mode :stick t) popwin:special-display-config)

;; CoffeeScript
(push '("*CoffeeREPL*" :stick t) popwin:special-display-config)

;; Clojure
(push '(cider-repl-mode :stick t) popwin:special-display-config)

;; zoom-window
(custom-set-variables
 '(zoom-window-use-elscreen t)
 '(zoom-window-mode-line-color "DarkOliveGreen"))
