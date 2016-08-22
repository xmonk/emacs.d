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
    ("e56ee322c8907feab796a1fb808ceadaab5caba5494a50ee83a13091d5b1a10c" "0dab8210ddeb721525453ec3613ca16cb251bf78b8468b1a132acc56ba6d79db" "627aa3dad5045dc7f4033899c86a6c2691b634592dcb1b160f17e36eafff358a" "daccdf23eec7e7225e52964b4d58f576e29381fd679386864100c256126db6ed" "8c48bd5ab93ade7c973bd0f4e2f8a3feaf9f084eeb8d704f4d183b796a2fe162" "ffb2b06b2608ca70c77bc07c590ca285509a15b1067979deb1fe8d96cbe3262a" default)))
 '(indent-tabs-mode t)
 '(magit-item-highlight-face nil)
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (php-mode elpy nasm-mode jedi rust-mode go-guru go-rename company-go go-errcheck go-eldoc anaconda-mode flycheck company ob-go xcscope whole-line-or-region web-mode use-package undo-tree smartscan py-yapf projectile paredit markdown-mode magit go-mode git-timemachine flycheck-pyflakes expand-region company-anaconda codesearch browse-kill-ring)))
 '(temporary-file-directory "/tmp"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-preview ((t (:background "black" :foreground "white" :underline t :font "Lucida Grande Mono" :height 120))))
 '(company-preview-common ((t (:inherit company-preview))))
 '(company-scrollbar-bg ((t (:background "white" :foreground "black"))))
 '(company-scrollbar-fg ((t (:foreground "white" :background "black"))))
 '(company-tooltip ((t (:background "black" :foreground "white" :font "Lucida Grande Mono" :height 120))))
 '(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
 '(company-tooltip-selection ((t (:background "white" :foreground "#1D1D1D" :font "Lucida Grande Mono" :height 120))))
 '(sp-pair-overlay-face ((t nil))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; osx-custom.el ends here
