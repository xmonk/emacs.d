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
  :init
  (add-hook 'lisp-mode-hook 'jj/lisp-mode-hook)
  (add-hook 'after-save-hook 'check-parens nil t)
  :config
  (use-package info-look
    :config
    (info-lookup-add-help
     :mode 'lisp-mode
     :regexp "[^][()'\" \t\n]+"
     :ignore-case t
     :doc-spec '(("(ansicl)Symbol Index" nil nil nil))))

  (use-package slime
	:if (file-directory-p "~/quicklisp")
	:disabled
	:commands slime
    :init
	(setq inferior-lisp-program "sbcl")
	(setq slime-contribs '(slime-repl slime-fuzzy inferior-slime slime-mdot-fu slime-company)) ;;slime-sbcl-exts
	:config
    (bind-key "C-c TAB" 'company-complete slime-mode-indirect-map)
	(bind-key "C-c TAB" 'company-complete slime-repl-mode-map)
    (slime-setup))

  (defun jj/lisp-mode-hook()
    (setq-default tab-width 2)
    (setq-default indent-tabs-mode nil)
    (bind-key "<return>" 'newline-and-indent)
    (abbrev-mode 1)
	(paredit-mode 1))

  (defun jj/inferior-lisp-mode-hook()
    (when (fboundp 'inferior-slime-mode)
	  (bind-key "<return>" 'slime-repl-return inferior-slime-mode-map)
      (inferior-slime-mode t)
	  (paredit-mode 1))))

(provide 'lisp-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; lisp-conf.el ends here
