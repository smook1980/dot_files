;;; slime
(require 'slime)
(slime-setup '(slime-repl slime-fancy slime-banner))

;; encoding
(setq slime-net-coding-system 'utf-8-unix)

;; popwin for slime
(push '("*slime-apropos*") popwin:special-display-config)
(push '("*slime-macroexpansion*") popwin:special-display-config)
(push '("*slime-description*") popwin:special-display-config)
(push '("*slime-compilation*" :noselect t) popwin:special-display-config)
(push '("*slime-xref*") popwin:special-display-config)
(push '(sldb-mode :stick t) popwin:special-display-config)
(push '(slime-repl-mode :stick t) popwin:special-display-config)
(push '(slime-connection-list-mode) popwin:special-display-config)

;; for clojure
(setq slime-protocol-version 'ignore)

;; face
(set-face-foreground 'slime-repl-inputed-output-face "pink1")

;;;; ac-slime
;; (install-elisp "https://github.com/purcell/ac-slime/raw/master/ac-slime.el")
(autoload 'slime "ac-slime")
(eval-after-load "ac-slime"
  '(progn
     (add-hook 'slime-mode-hook 'set-up-slime-ac)
     (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)))

(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

;; popwin-w3m for hyperspec
;; (install-elisp "https://raw.github.com/m2ym/popwin-el/v0.3/misc/popwin-w3m.el")
(autoload 'slime "popwin-w3m" nil t)
(eval-after-load "popwin-w3m"
  '(progn
     (push '("^file://.*HyperSpec.*\\.htm$" :height 0.4)
           popwin:w3m-special-display-config)
     (defadvice slime-hyperspec-lookup (around hyperspec-lookup-around activate)
       (let ((browse-url-browser-function 'popwin:w3m-browse-url))
         ad-do-it))))
