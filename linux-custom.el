;;; linux-custom.el --- Custom configration
;;
;; Filename: linux-custom.el
;; Description:
;; Author: Juan Fuentes
;; Maintainer:
;; Created: Wed Mar  9 15:13:07 2016 (-0500)
;; Version:
;; Package-Requires: ()
;; Last-Updated:
;;           By:
;;     Update #: 3
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
 '(frame-background-mode (quote dark))
 '(magit-item-highlight-face nil)
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (workgroups2 ob-go tuareg company-anaconda anaconda-mode go-mode magit flycheck browse-kill-ring whole-line-or-region smartscan codesearch expand-region web-mode markdown-mode projectile undo-tree git-timemachine xcscope paredit company use-package))))
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
 '(sp-pair-overlay-face ((t nil)))
 '(eshell-prompt ((t (:inherit default)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; linux-custom.el ends here
