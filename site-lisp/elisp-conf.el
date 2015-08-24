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

(add-hook 'emacs-lisp-mode-hook '(lambda () (paredit-mode 1)))
(add-hook 'lisp-interaction-mode-hook '(lambda() (paredit-mode 1)))
(add-hook 'after-save-hook 'check-parens)
(if (string-equal buffer-file-name (expand-file-name user-init-file))
    (add-hook 'after-save-hook 'compile-init-file t t))

(provide 'elisp-conf)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; elisp-conf.el ends here
