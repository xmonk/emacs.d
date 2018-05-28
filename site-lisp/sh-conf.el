;;; sh-conf.el --- Shell configuration
;;
;; Filename: sh-conf.el
;; Description:
;; Author: Juan Fuentes
;; Maintainer:
;; Created: Thu May  5 16:49:15 2016 (-0400)
;; Version:
;; Package-Requires: ()
;; Last-Updated:
;;           By:
;;     Update #: 4
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

(use-package sh-mode
  :commands (sh-mode shell-script-mode)
  :init
  (defun jj/sh-hook ()
    (setq-local tab-width 4)
    (setq-local indent-tabs-mode nil)
    (setq-default sh-basic-offset 4)
    (setq-default sh-indentation 4)
    (setq-default sh-indent-for-case-label 0)
    (setq-default sh-indent-for-case-alt '+))
  (add-hook 'sh-mode-hook 'jj/sh-hook))

(provide 'sh-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; sh-conf.el ends here
