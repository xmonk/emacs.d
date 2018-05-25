;;; ace-window
(use-package ace-window
  :ensure t
  :bind (("M-o" . ace-window)))

;;; winner mode
(use-package winner
  :bind (("C-c <left>" . winner-undo)
         ("C-c <right>" . winner-redo))
  :init
  (winner-mode 1))

;;; windmove
(use-package windmove
  :bind (("s-h" . windmove-left)
         ("s-l" . windmove-right)
         ("s-k" . windmove-up)
         ("s-j" . windmove-down))
  :init
  (setq windmove-wrap-around t)
  (windmove-default-keybindings 'super))

;;; Paste at point NOT at cursor
(use-package mwheel
  :init
  (setq mouse-yank-at-point 't))

(provide 'window)
