;;; magit-conf.el --- Magit configuration.
;;
;; Filename: magit-conf.el
;; Description:
;; Author: Juan Fuentes
;; Maintainer:
;; Created: Fri Oct 30 09:18:12 2009 (-0400)
;; Version:
;; Package-Requires: ()
;; Last-Updated: Wed Apr  1 20:32:19 2015 (-0400)
;;           By:
;;     Update #: 26
;; URL:
;; Doc URL:
;; Keywords:
;; Compatibility:
;;
;;
;;; Commentary:
;;
;;
;;; Change Log:
;;
;;
;;; Code:

(use-package magit
  :commands (magit-status mgit)
  :ensure t
  :init
  (defalias 'mgit 'magit-status)
  :config
  (defadvice magit-status (around magit-fullscreen activate)
    (window-configuration-to-register :magit-fullscreen)
    ad-do-it
    (delete-other-windows))

  (defadvice magit-mode-quit-window (after magit-restore-screen activate)
    (jump-to-register :magit-fullscreen)))
(use-package magithub
    :disabled
    :ensure t
    :after magit
    :config
    (magithub-feature-autoinject t))

(use-package magit-todos
  :ensure t
  :after magit
  :commands magit-todos-mode
  :init
  (magit-todos-mode 1))

(provide 'magit-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; magit-conf.el ends here
