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
    ("86450e783c6b9ba009e53aa7eaf647468c09bf3463482c58da66b1512a6cb2dc" "aa25660125463fed1b90638b816fbc26568a27bd8278d39f54df4bfc82e3bf1e" default)))
 '(indent-tabs-mode t)
 '(magit-item-highlight-face nil)
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (ggtags magit-popup git-commit with-editor async pkg-info epl pythonic f s dash caml flx company-flx swift-mode org tuareg workgroups2 php-mode elpy nasm-mode jedi rust-mode go-guru go-rename company-go go-errcheck go-eldoc anaconda-mode flycheck company ob-go xcscope whole-line-or-region web-mode use-package undo-tree smartscan py-yapf projectile paredit markdown-mode magit go-mode git-timemachine flycheck-pyflakes expand-region company-anaconda codesearch browse-kill-ring)))
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
