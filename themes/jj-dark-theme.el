;;; jj-dark --- Personal theme
;;
;; Filename: jj-dark-theme.el
;; Description:
;; Author: Juan Fuentes
;; Maintainer:
;; Created: Wed Mar 18 06:39:42 2015 (-0400)
;; Version:
;; Package-Requires: ()
;; Last-Updated:
;;           By:
;;     Update #: 34
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

(deftheme jj-dark "My personal theme")
  (custom-theme-set-faces 'jj-dark
   '(default ((t (:foreground "#D0D0D0" :background "black"))))
   '(cursor ((t (:background "#D0D0D0" :foreground "#D0D0D0"))))
   '(mode-line ((t (:foreground "black" :background "white" :box nil :font "Lucida Grande" :height 120 :slant normal :weight normal))))
   '(mode-line-inactive ((t (:foreground "#D0D0D0" :background "black" :box nil :font "Lucida Grande" :height 120 :slant normal :weight light))))
   '(linum ((t (:stipple nil :background "black" :foreground "#D0D0D0" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 92 :width normal :family "Lucida Grande"))))
   '(font-lock-builtin-face ((t (:foreground "#D0D0D0" :bold nil ))))
   '(font-lock-comment-face ((t (:foreground "#D0D0D0" :slant italic :weight normal ))))
   '(font-lock-comment-delimiter-face ((t (:foreground "#D0D0D0" :slant normal))))
   '(font-lock-function-name-face ((t (:foreground "#D0D0D0" :bold nil))))
   '(font-lock-keyword-face ((t (:foreground "#D0D0D0" :weight bold))))
   '(font-lock-preprocessor-face ((t (:foreground "#D0D0D0" :bold nil))))
   '(font-lock-regexp-grouping-backslash ((t (:foreground "#D0D0D0"))))
   '(font-lock-regexp-grouping-construct ((t (:foreground "#D0D0D0"))))
   '(font-lock-string-face ((t (:foreground "#D0D0D0" ))))
   '(font-lock-type-face ((t (:foreground "#D0D0D0" ))))
   '(font-lock-constant-face ((t (:foreground "#D0D0D0" ))))
   '(font-lock-variable-name-face ((t (:foreground "#D0D0D0" ))))
   '(minibuffer-prompt ((t (:foreground "#D0D0D0" :bold t ))))
   '(org-code ((t (:foreground "#D0D0D0" :weight bold))))
   '(org-verbatim ((t (:foreground "#D0D0D0"))))
   '(org-agenda-dimmed-todo-face ((t (:inherit default :weight bold))))
   '(org-agenda-done ((t (:inherit nil :strike-through t))))
   '(org-done ((t (:weight bold :strike-through t))))
   '(org-headline-done ((((class color) (min-colors 16) (background light)) (:weigth bold :strike-through t))))
   '(org-todo ((t (:inherit default :weight bold))))
   '(ido-subdir ((t (:weight bold))))
   ;;; magit
   '(magit-item-highlight-face ((t (:inherit default))))
   '(magit-dimmed ((t (:inherit default))))
   '(magit-diff-hunk-heading ((t (:inherit default))))
   '(magit-diff-hunk-heading-highlight ((t (:inherit default))))
   '(magit-diff-added ((t (:inherit default))))
   '(magit-diff-added-highlight ((t (:inherit default))))
   '(magit-diff-removed ((t (:inherit default))))
   '(magit-diff-removed-highlight ((t (:inherit default))))
   ;;; auto-complete
   '(ac-completion-face ((t (:background "black" :foreground "#D0D0D0"))))
   '(ac-candidate-face ((t (:background "black" :foreground "#D0D0D0"))))
   '(ac-selection-face ((t (:background "#D0D0D0" :foreground "black" :bold t ))))
   '(popup-face ((t (:inherit default))))
   '(popup-summary-face ((t (:inherit default))))
   '(popup-menu-face ((t (:inherit default))))
   '(popup-tip-face ((t (:background "#D0D0D0" :foreground "black" :bold t :font "Lucida Grande Mono Nrw" :height 120))))
   ;;; company
   '(company-preview ((t (:foreground "#D0D0D0" :underline t :font "Lucida Grande Mono Nrw" :height 120))))
   '(company-preview-common ((t (:inherit company-preview))))
   '(company-scrollbar-bg ((t (:background "black" :foreground "#D0D0D0"))))
   '(company-scrollbar-fg ((t (:background "#D0D0D0" :foreground "black"))))
   '(company-tooltip ((t (:background "black" :foreground "#D0D0D0" :font "Lucida Grande Mono" :height 120))))
   '(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
   '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
   '(company-tooltip-selection ((t (:background "#D0D0D0" :foreground "black" :font "Lucida Grande Mono" :height 120))))
   ;;; eshell
   '(eshell-prompt ((t (:inherit default))))
   '(font-lock-warning-face ((t (:foreground "black" :bold t :underline t)))))

;;; ###autoload
(and load-file-name
    (boundp 'custom-theme-load-path)
    (add-to-list 'custom-theme-load-path
                 (file-name-as-directory
                  (file-name-directory load-file-name))))
;; Automatically add this theme to the load path

(provide-theme 'jj-dark)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; jj-dark-theme.el ends here
