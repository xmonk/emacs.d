;;; elisp-conf.el --- Emacs Lisp configuration
;;
;; Filename: elisp-conf.el
;; Description:
;; Author: Juan Fuentes
;; Maintainer:
;; Created: Tue Jun 10 18:00:20 2008
;; Version:
;; Package-Requires: ()
;; Last-Updated: Wed Apr  1 22:26:21 2015 (-0400)
;;           By:
;;     Update #: 24
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


(defun jj/emacs-lisp-mode-hook()
  (eldoc-mode t)
  (setq-default tab-width 2)
  (setq-default indent-tabs-mode nil)
  (define-key emacs-lisp-mode-map (kbd "<return>") 'newline-and-indent)
  ;; Compile my .emacs file.
  (if (string-equal buffer-file-name (expand-file-name user-init-file))
      (add-hook 'after-save-hook 'compile-init-file t t)))

(add-hook 'emacs-lisp-mode-hook 'jj/emacs-lisp-mode-hook)
(add-hook 'after-save-hook 'check-parens)

(provide 'elisp-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; elisp-conf.el ends here
