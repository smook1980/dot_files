;; view-mode
(custom-set-variables
 '(view-read-only t))

(with-eval-after-load 'view
  (define-key view-mode-map (kbd "N") 'View-search-last-regexp-backward)
  (define-key view-mode-map (kbd "?") 'View-search-regexp-backward?)
  (define-key view-mode-map (kbd "g") 'View-goto-line)
  (define-key view-mode-map (kbd "G") 'editutil-goto-last-line)
  (define-key view-mode-map (kbd "f") 'editutil-forward-char)
  (define-key view-mode-map (kbd "F") 'editutil-backward-char)
  (define-key view-mode-map (kbd "w") 'forward-word)
  (define-key view-mode-map (kbd "W") 'forward-symbol)
  (define-key view-mode-map (kbd "b") 'backward-word)
  (define-key view-mode-map (kbd "B") 'editutil-backward-symbol)
  (define-key view-mode-map (kbd "e") 'editutil-view-word-end)

  (define-key view-mode-map (kbd "i") 'editutil-view-insert)
  (define-key view-mode-map (kbd "a") 'editutil-view-insert-at-next)
  (define-key view-mode-map (kbd "I") 'editutil-view-insert-at-bol)
  (define-key view-mode-map (kbd "A") 'editutil-view-insert-at-eol)

  (define-key view-mode-map (kbd "q") 'editutil-view-quit)
  (define-key view-mode-map (kbd "h") 'backward-char)
  (define-key view-mode-map (kbd "j") 'next-line)
  (define-key view-mode-map (kbd "k") 'previous-line)
  (define-key view-mode-map (kbd "l") 'forward-char)
  (define-key view-mode-map (kbd "[") 'backward-paragraph)
  (define-key view-mode-map (kbd "]") 'forward-paragraph))

(with-eval-after-load 'doc-view
  (define-key doc-view-mode-map (kbd "j") 'doc-view-next-line-or-next-page)
  (define-key doc-view-mode-map (kbd "k") 'doc-view-previous-line-or-previous-page))
