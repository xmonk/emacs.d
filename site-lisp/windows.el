;; don't scroll like a maniac
(defvar mouse-wheel-scroll-amount '(1))
(defvar mouse-wheel-progressive-speed nil)
(setq scroll-preserve-screen-position 'always)

;;; winner mode
(use-package winner
  :bind (("C-c <left>" . winner-undo)
         ("C-c <right>" . winner-redo))
  :init
  (winner-mode 1))

;;; windmove
(use-package windmove
  :bind (("C-c w h" . windmove-left)
         ("C-c w l" . windmove-right)
         ("C-c w k" . windmove-up)
         ("C-c w j" . windmove-down))
  :init
  (setq windmove-wrap-around t))

;;; Paste at point NOT at cursor
(use-package mwheel
  :init
  (setq mouse-yank-at-point 't))

;;; ace-window
(use-package ace-window
  :ensure t
  :bind (("M-o" . ace-window)))

;;; multi-term
(use-package multi-term
  :load-path "vendor/"
  :init
  (setq multi-term-program (getenv "SHELL")))

(provide 'windows)
