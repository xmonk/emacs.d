;;; lisp-conf.el ---  Common Lisp configuration
;;
;; Filename: lisp-conf.el
;; Description:
;; Author: Juan Fuentes
;; Maintainer:
;; Created: Sat Apr 18 14:13:19 2015 (-0400)
;; Version:
;; Package-Requires: ()
;; Last-Updated: Sat Apr 18 14:13:42 2015 (-0400)
;;           By:
;;     Update #: 2
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

(use-package lisp-mode
  :commands lisp-mode
  :config
  (use-package info-look
    :config
    (info-lookup-add-help
     :mode 'lisp-mode
     :regexp "[^][()'\" \t\n]+"
     :ignore-case t
     :doc-spec '(("(ansicl)Symbol Index" nil nil nil))))

  (defun jj/lisp-mode-hook()
    (setq-default tab-width 2)
    (setq-default indent-tabs-mode nil)
    (abbrev-mode 1)
    (bind-key "<return>" 'newline-and-indent)
    (hs-minor-mode)
    (if (fboundp 'slime-mode)
        (slime-mode t)))

  (defun jj/inferior-lisp-mode-hook()
    (if (fboundp 'inferior-slime-mode)
        (inferior-slime-mode t)))

  (add-hook 'lisp-mode-hook 'jj/lisp-mode-hook)
  (add-hook 'inferior-lisp-mode-hook 'jj/inferior-lisp-mode-hook)
  (add-hook 'after-save-hook 'check-parens nil t))

(provide 'lisp-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; lisp-conf.el ends here
