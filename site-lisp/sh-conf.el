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
  :defines (sh-basic-offset sh-indentation sh-indent-for-case-label sh-indent-for-case-alt)
  :commands (sh-mode shell-script-mode)
  :init
  (setq-local tab-width 4)
  (setq-local indent-tabs-mode t)
  (setq-local sh-basic-offset 4)
  (setq-local sh-indentation 4)
  (setq-local sh-indent-for-case-label 0)
  (setq-local sh-indent-for-case-alt '+))

(provide 'sh-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; sh-conf.el ends here
