;;; elisp-conf.el --- Emacs Lisp configuration
;;
;; Filename: elisp-conf.el
;; Description:
;; Author: Juan Fuentes
;; Maintainer:
;; Created: Tue Jun 10 18:00:20 2008 (-0400)
;; Version:
;; Package-Requires: ()
;; Last-Updated: Sat Apr 18 14:09:07 2015 (-0400)
;;           By:
;;     Update #: 25
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

(use-package emacs-lisp-mode
  :commands (emacs-lisp-mode ielm)
  :init
  (add-hook 'emacs-lisp-mode-hook #'paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'paredit-mode)
  (add-hook 'ielm-mode-hook #'paredit-mode)
  (add-hook 'after-save-hook 'check-parens)
  (add-hook 'emacs-lisp-mode-hook #'flycheck-mode)
  :config
  (setq-default tab-width '2)
  (setq-default indent-tabs-mode nil)
  (if (string-equal buffer-file-name (expand-file-name user-init-file))
      (add-hook 'after-save-hook 'compile-init-file t t))
  ;;; elisp-nav
  (use-package elisp-slime-nav
    :ensure t
    :commands elisp-slime-nav-mode
    :diminish elisp-slime-nav
    :config
    (dolist (hook '(emacs-lisp-mode-hook lisp-interaction-mode-hook))
      (add-hook hook 'turn-on-elisp-slime-nav-mode))))

(provide 'elisp-conf)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; elisp-conf.el ends here
