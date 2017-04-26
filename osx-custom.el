;;; osx-custom.el ---  OS X custom file.
;;
;; Filename: osx-custom.el
;; Description:
;; Author: Juan Fuentes
;; Maintainer:
;; Created: Fri Aug 21 09:14:29 2015 (-0400)
;; Version:
;; Package-Requires: ()
;; Last-Updated:
;;           By:
;;     Update #: 9
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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-python-pyflakes-executable "pyflakes")
 '(gnutls-trustfiles
   (quote
    ("/etc/ssl/certs/ca-certificates.crt" "/etc/pki/tls/certs/ca-bundle.crt" "/etc/ssl/ca-bundle.pem" "/usr/ssl/certs/ca-bundle.crt" "/usr/local/share/certs/ca-root-nss.crt" "/usr/local/etc/openssl/cert.pem" "~/.certs/ca-certificates.pem")))
 '(indent-tabs-mode t)
 '(magit-item-highlight-face nil)
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (go-guru go-rename company-go go-errcheck go-eldoc color-theme-sanityinc-tomorrow company-anaconda anaconda-mode py-yapf go-mode magit flycheck browse-kill-ring whole-line-or-region codesearch expand-region web-mode markdown-mode projectile undo-tree git-timemachine xcscope paredit company-flx company use-package)))
 '(temporary-file-directory "/tmp"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 (unless custom-enabled-themes
   '(company-preview ((t (:background "blue" :foreground "grey"))))
   '(company-preview-common ((t (:inherit company-preview))))
   '(company-scrollbar-bg ((t (:background "grey" :foreground "black"))))
   '(company-scrollbar-fg ((t (:foreground "grey" :background "black"))))
   '(company-tooltip ((t (:background "black" :foreground "grey" :font "SF Mono" :height 120))))
   '(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
   '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
   '(company-tooltip-selection ((t (:background "grey" :foreground "#1D1D1D" :font "SF Mono" :height 120)))))
 '(eshell-prompt ((t (:inherit default))))
 '(sp-pair-overlay-face ((t nil))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; osx-custom.el ends here
