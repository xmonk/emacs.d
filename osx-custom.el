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
 '(custom-safe-themes
   (quote
    ("372b627d8f8998d2d7c6a50d3aba91d8535c2f8dfd265288ea7dcc5374752b27" "60a16cd1aeabad334e8836be393582eabb0e931f34ae80f064ff2306de864f46" "86450e783c6b9ba009e53aa7eaf647468c09bf3463482c58da66b1512a6cb2dc" "aa25660125463fed1b90638b816fbc26568a27bd8278d39f54df4bfc82e3bf1e" default)))
 '(flycheck-python-pyflakes-executable "pyflakes")
 '(gnutls-trustfiles
   (quote
    ("/etc/ssl/certs/ca-certificates.crt" "/etc/pki/tls/certs/ca-bundle.crt" "/etc/ssl/ca-bundle.pem" "/usr/ssl/certs/ca-bundle.crt" "/usr/local/share/certs/ca-root-nss.crt" "/usr/local/etc/openssl/cert.pem" "~/.certs/ca-certificates.pem")))
 '(indent-tabs-mode t)
 '(magit-item-highlight-face nil)
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (company-flx company-go flycheck-pyflakes-executable flycheck-flak anaconda-mode company-anaconda company go-mode flycheck rust-mode rustfmt ob-go xcscope whole-line-or-region web-mode use-package undo-tree py-yapf projectile php-mode paredit markdown-mode magit go-rename go-guru go-errcheck go-eldoc git-timemachine ggtags flycheck-pyflakes expand-region codesearch browse-kill-ring)))
 '(temporary-file-directory "/tmp"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-preview ((t (:background "blue" :foreground "grey"))))
 '(company-preview-common ((t (:inherit company-preview))))
 '(company-scrollbar-bg ((t (:background "grey" :foreground "black"))))
 '(company-scrollbar-fg ((t (:foreground "grey" :background "black"))))
 '(company-tooltip ((t (:background "black" :foreground "grey" :font "SF Mono" :height 120))))
 '(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
 '(company-tooltip-selection ((t (:background "grey" :foreground "#1D1D1D" :font "SF Mono" :height 120))))
 '(sp-pair-overlay-face ((t nil))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; osx-custom.el ends here
