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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-item-highlight-face nil)
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (helm-ls-hg helm-ls-git helm-c-moccur helm company-jedi utop anaconda-mode paredit-mode nasm-mode company-quickhelp company-mode go-company company company-anaconda company-go disaster helm-flycheck helm-swoop helm-pydoc helm-projectile ggtags projectile ac-c-headers jedi swiper multi-term header2 smex flx-ido smartscan flycheck browse-kill-ring codesearch expand-region flycheck-pyflakes git-timemachine go-eldoc go-errcheck go-mode magit markdown-mode merlin ocp-indent tuareg undo-tree whole-line-or-region paredit use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-preview ((t (:foreground "darkgray" :underline t :font "Lucida Grande Mono" :height 120))))
 '(company-preview-common ((t (:inherit company-preview))))
 '(company-scrollbar-bg ((t (:background "lightgray" :foreground "white"))))
 '(company-scrollbar-fg ((t (:foreground "lightgray" :background "steelblue"))))
 '(company-tooltip ((t (:background "lightgray" :foreground "black" :font "Lucida Grande Mono" :height 120))))
 '(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
 '(company-tooltip-selection ((t (:background "steelblue" :foreground "white" :font "Lucida Grande Mono" :height 120))))
 '(eshell-prompt ((t (:inherit default)))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; osx-custom.el ends here
