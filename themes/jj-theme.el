;;; jj --- Personal theme
;;
;; Filename: jj-theme.el
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

(deftheme jj "My personal theme")
(let ((class '((class color) (min-colors 89)))
      (fg1 "#000000")
      (bg1 "#ffffff")
      (region "#A4CDFC"))

  (custom-theme-set-faces
   'jj
   `(default ((,class (:foreground ,fg1 :background nil))))
   `(cursor ((,class (:background ,fg1 ))))
   `(region ((,class (:background ,region :foreground ,fg1))))
   `(mode-line ((,class (:foreground ,bg1 :background ,fg1 :box nil :font "Lucida Grande" :height 120 :slant normal :weight normal))))
   `(mode-line-inactive ((,class (:foreground ,fg1 :background "grey92" :box nil :font "Lucida Grande" :height 120 :slant normal :weight light :box t))))
   `(linum ((,class (:stipple nil :background ,bg1 :foreground ,fg1 :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 92 :width normal :family "Lucida Grande"))))
   `(font-lock-builtin-face ((,class (:foreground ,fg1 :bold nil ))))
   `(font-lock-comment-face ((,class (:foreground ,fg1 :slant italic :weight normal ))))
   `(font-lock-comment-delimiter-face ((,class (:foreground ,fg1 :slant normal))))
   `(font-lock-function-name-face ((,class (:foreground ,fg1 :bold nil))))
   `(font-lock-keyword-face ((,class (:foreground ,fg1 :weight bold))))
   `(font-lock-preprocessor-face ((,class (:foreground ,fg1 :bold nil))))
   `(font-lock-regexp-grouping-backslash ((,class (:foreground ,fg1))))
   `(font-lock-regexp-grouping-construct ((,class (:foreground ,fg1))))
   `(font-lock-string-face ((,class (:foreground ,fg1 ))))
   `(font-lock-type-face ((,class (:foreground ,fg1 ))))
   `(font-lock-constant-face ((,class (:foreground ,fg1 ))))
   `(font-lock-variable-name-face ((,class (:foreground ,fg1 ))))
   `(font-lock-warning-face ((,class (:foreground ,fg1 :bold t :underline t))))
   `(minibuffer-prompt ((,class (:foreground ,fg1 :bold t ))))
   `(org-code ((,class (:foreground ,fg1 :weight bold))))
   `(org-verbatim ((,class (:foreground ,fg1))))
   `(org-agenda-dimmed-todo-face ((,class (:inherit default :weight bold))))
   `(org-agenda-done ((,class (:inherit nil :strike-through t))))
   `(org-done ((,class (:weight bold :strike-through t))))
   `(org-headline-done ((((class color) (min-colors 16) (background light)) (:weigth bold :strike-through t))))
   `(org-todo ((,class (:inherit default :weight bold))))
   `(ido-subdir ((,class (:weight bold))))
   ;;; magit
   `(magit-item-highlight-face ((,class (:inherit default))))
   `(magit-dimmed ((,class (:inherit default))))
   `(magit-diff-hunk-heading ((,class (:inherit default))))
   `(magit-diff-hunk-heading-highlight ((,class (:inherit default))))
   `(magit-diff-added ((,class (:inherit default))))
   `(magit-diff-added-highlight ((,class (:inherit default))))
   `(magit-diff-removed ((,class (:inherit default))))
   `(magit-diff-removed-highlight ((,class (:inherit default))))
   ;;; auto-complete
   `(ac-completion-face ((,class (:background "grey95" :foreground ,fg1))))
   `(ac-candidate-face ((,class (:background "grey95" :foreground ,fg1))))
   `(ac-selection-face ((,class (:background ,fg1 :foreground ,bg1 :bold t ))))
   `(popup-face ((,class (:inherit default))))
   `(popup-summary-face ((,class (:inherit default))))
   `(popup-menu-face ((,class (:inherit default))))
   `(popup-tip-face ((,class (:background "grey95" :foreground ,fg1 :bold t :font "Lucida Grande Mono Nrw" :height 120))))
   ;;; company
   `(company-preview ((,class (:foreground ,fg1 ::underline t :height 120))))
   `(company-preview-common ((,class (:inherit company-preview))))
   `(company-scrollbar-bg ((,class (:background ,bg1 :foreground ,fg1))))
   `(company-scrollbar-fg ((,class (:background ,fg1 :foreground ,bg1))))
   `(company-tooltip ((,class (:background ,bg1 :foreground ,fg1 :height 120))))
   `(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
   `(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
   `(company-tooltip-selection ((,class (:background ,fg1 :foreground ,bg1 :height 120))))
   ;;; eshell
   `(eshell-prompt ((,class (:inherit default))))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
	       (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'jj)
;; Local Variables:
;; no-byte-compile: t
;; End:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; jj-theme.el ends here
