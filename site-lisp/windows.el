;; don't scroll like a maniac
(defvar mouse-wheel-scroll-amount '(1))
(defvar mouse-wheel-progressive-speed nil)
(setq scroll-preserve-screen-position 'always)

;;; winner mode
(use-package winner
  :bind (("C-c <left>" . winner-undo)
         ("C-c <right>" . winner-redo))
  :config
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
  :functions mouse-wheel-mode
  :init
  (setq mouse-yank-at-point 't)
  :config
  (mouse-wheel-mode 1))

;;; ace-window
(use-package ace-window
  :ensure t
  :bind (("M-o" . ace-window)))

;;; multi-term
(use-package multi-term
  :load-path "vendor/"
  :commands multi-term
  :init
  (defalias 'mterm 'multi-term)
  (setq multi-term-program (getenv "SHELL")))

(use-package nswbuff
  :ensure t
  :functions nswbuff-projectile-buffer-list
  :bind* (("<C-tab>"           . nswbuff-switch-to-next-buffer)
          ("<C-S-iso-lefttab>" . nswbuff-switch-to-previous-buffer))
  :config
  (setq nswbuff-buffer-list-function #'nswbuff-projectile-buffer-list
        nswbuff-display-intermediate-buffers t))

(provide 'windows)
