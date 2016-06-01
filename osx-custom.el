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
 '(indent-tabs-mode t)
 '(font-lock-mode nil)
 '(global-font-lock-mode nil)
 '(font-lock-maximum-decoration nil)
 '(magit-item-highlight-face nil)
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (company-go rustfmt rust-fmt rust-mode flycheck-ocaml c-eldoc smex xcscope go-guru web-mode ob-go anaconda-mode flycheck company org-plus-contrib org go-rename go-mode direx whole-line-or-region utop use-package undo-tree tuareg swiper smartscan projectile paredit ocp-indent merlin markdown-mode magit hydra header2 go-errcheck go-eldoc git-timemachine flycheck-pyflakes expand-region company-anaconda codesearch browse-kill-ring)))
 '(temporary-file-directory "/tmp"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eshell-prompt ((t (:inherit default))))
 '(sp-pair-overlay-face ((t nil))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; osx-custom.el ends here
