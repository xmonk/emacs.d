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

(require 'semantic/sb)
(require 'semantic/ia)

(semantic-mode t)

(semanticdb-enable-gnu-global-databases 'c-mode t)
(semanticdb-enable-gnu-global-databases 'c++-mode t)
(semanticdb-enable-gnu-global-databases 'python-mode t)

(semantic-add-system-include "/Library/Python/2.7/site-packages:/Users/jj/Library/Python/2.7/lib/python/site-packages" 'python-mode)

(provide 'cedet-conf)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; cedet-conf.el ends here
