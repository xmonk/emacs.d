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
    ("451cb80ff909630fcbad322fa8d8d02d304f24b2c1b0f4ddb0b4ca25b1e8faeb" default)))
 '(font-lock-maximum-decoration t)
 '(font-lock-mode t)
 '(global-font-lock-mode t)
 '(indent-tabs-mode t)
 '(magit-item-highlight-face nil)
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (go-guru go-rename company-go go-errcheck go-eldoc tuareg anaconda-mode flycheck company xcscope whole-line-or-region web-mode use-package undo-tree smartscan rustfmt rust-mode py-yapf projectile paredit ob-go markdown-mode magit go-mode git-timemachine flycheck-pyflakes expand-region company-anaconda codesearch browse-kill-ring)))
 '(temporary-file-directory "/tmp"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-preview ((t (:foreground "black" :underline t :font "Lucida Grande Mono" :height 120))))
 '(company-preview-common ((t (:inherit company-preview))))
 '(company-scrollbar-bg ((t (:background "white" :foreground "black"))))
 '(company-scrollbar-fg ((t (:foreground "white" :background "black"))))
 '(company-tooltip ((t (:background "white" :foreground "black" :font "Lucida Grande Mono" :height 120))))
 '(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
 '(company-tooltip-selection ((t (:background "#1D1D1D" :foreground "white" :font "Lucida Grande Mono" :height 120))))
 '(eshell-prompt ((t (:inherit default))))
 '(sp-pair-overlay-face ((t nil))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; osx-custom.el ends here
