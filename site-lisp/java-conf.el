;;; java-conf.el ---  Java configuration
;;
;; Filename: java-conf.el
;; Description:
;; Author: Juan Fuentes
;; Maintainer:
;; Created: Sat Jul  4 14:54:49 2015 (-0400)
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

(autoload 'wisent-java-default-setup "wisent-java" "Java semantic setup." nil nil)
(add-hook 'java-mode-hook (lambda()
							(c-set-style "java")
							(setq-default tab-width '4)
							(setq-default indent-tabs-mode t)
							(setq fill-column 120)
							(setq comment-column 72)))

(provide 'java-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; java-conf.el ends here
