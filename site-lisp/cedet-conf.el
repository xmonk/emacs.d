;;; cedet-conf.el ---  CEDET configuration.
;;
;; Filename: cedet-conf.el
;; Description:
;; Author: Juan Fuentes
;; Maintainer:
;; Created: Thu Nov 10 16:04:00 2016 (-0400)
;; Version:
;; Package-Requires: ()
;; Last-Updated: Thu Nov 10 16:04:00 2016 (-0400)
;;           By:
;;     Update #: 1
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

(global-ede-mode t)
(require 'semantic/sb)
(require 'semantic/ia)

(global-semantic-decoration-mode t)
(global-semantic-highlight-func-mode t)
(global-semantic-show-unmatched-syntax-mode t)
(global-semantic-idle-completions-mode t)
(semantic-mode t)

;; Enable srecode
(require 'srecode)
(srecode-minor-mode 1)

;; (setq common-cedet-mode-list
;;       (list 'c-mode-common-hook
;;             'lisp-mode-hook
;;             'emacs-lisp-mode-hook
;;             'python-mode-hook
;;             'makefile-mode-hook))

(semanticdb-enable-gnu-global-databases 'c-mode t)
(semanticdb-enable-gnu-global-databases 'c++-mode t)
(semanticdb-enable-gnu-global-databases 'python-mode t)

(semantic-add-system-include "/Library/Python/2.7/site-packages:/Users/jj/Library/Python/2.7/lib/python/site-packages" 'python-mode)

(provide 'cedet-conf)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; cedet-conf.el ends here
