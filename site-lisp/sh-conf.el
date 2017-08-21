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

(defun jj/sh-hook ()
  "personal shell hook"
  (setq-default tab-width 4)
  (setq-default indent-tabs-mode t)
  (setq sh-basic-offset 4
	sh-indentation 4
	sh-indent-for-case-label 0
	sh-indent-for-case-alt '+))

(add-hook 'shell-script-mode 'jj/sh-hook)
(add-hook 'sh-mode-hook 'jj/sh-hook)
(provide 'sh-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; sh-conf.el ends here
