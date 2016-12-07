;;; jj-dark --- Personal theme
;;
;; Filename: jj-dark.el
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

;; #D0D0D0

(deftheme jj-dark)

(defvar jj-faces
  `(default
     font-lock-builtin-face
     font-lock-comment-delimiter-face
     font-lock-comment-face
     font-lock-constant-face
     font-lock-doc-face
     font-lock-function-name-face
     font-lock-keyword-face
     font-lock-negation-char-face
     font-lock-function-name-face
     font-lock-keyword-face
     font-lock-negation-char-face
     font-lock-preprocessor-face
     font-lock-regexp-grouping-backslash
     font-lock-regexp-grouping-construct
     font-lock-string-face
     font-lock-type-face
     font-lock-variable-name-face
     font-lock-warning-face
     fringe
     mode-line))

(let ((black "#000000")
      (white "#FFFFFF"))
  (apply 'custom-theme-set-faces 'jj-dark
	 ;; `(mode-line ((t (:box nil))))
	 `(font-lock-warning-face ((t (:foreground ,white :background ,black :font "Lucida Grande" :height 130 :slant normal :weight bold))))
	 `(mode-line ((t (:foreground ,black :background "gray" :box nil :font "Lucida Grande" :height 120 :slant normal :weight normal))))
	 `(mode-line-inactive ((t (:foreground ,black :background "darkgray" :box nil :font "Lucida Grande" :height 120 :slant normal :weight light))))
	 `(cursor ((t (:background ,white :foreground ,black))))
	 `(org-code ((t (:foreground ,white :weight bold))))
	 `(org-verbatim ((t (:foreground ,white))))
	 `(org-agenda-dimmed-todo-face ((t (:inherit default :weight bold))))
	 `(org-agenda-done ((t (:inherit nil :strike-through t))))
	 `(org-done ((t (:weight bold :strike-through t))))
	 `(org-todo ((t (:inherit default :weight bold))))
	 `(ido-subdir ((t (:weight bold))))
	 ;; magit
	 `(magit-item-highlight-face ((t (:inherit default))))
	 `(magit-dimmed ((t (:inherit default))))
	 `(magit-diff-hunk-heading ((t (:inherit default))))
	 `(magit-diff-hunk-heading-highlight ((t (:inherit default))))
	 `(magit-diff-added ((t (:inherit default))))
	 `(magit-diff-added-highlight ((t (:inherit default))))
	 `(magit-diff-removed ((t (:inherit default))))
	 `(magit-diff-removed-highlight ((t (:inherit default))))
	 ;; auto-complete
	 `(ac-completion-face ((t (:background ,black :foreground ,white))))
	 `(ac-candidate-face ((t (:background ,black :foreground ,white))))
	 `(ac-selection-face ((t (:background ,white :foreground ,black :bold t ))))
	 `(popup-face ((t (:inherit default))))
	 `(popup-summary-face ((t (:inherit default))))
	 `(popup-menu-face ((t (:inherit default))))
	 `(popup-tip-face ((t (:background ,white :foreground ,black :bold t :font "Lucida Grande Mono Nrw" :height 120))))
	 ;; company
	 `(company-preview ((t (:foreground ,white :underline t :font "Lucida Grande Mono Nrw" :height 120))))
	 `(company-preview-common ((t (:inherit company-preview))))
	 `(company-scrollbar-black ((t (:background ,black :foreground ,white))))
	 `(company-scrollbar-fg ((t (:background ,white :foreground ,black))))
	 `(company-tooltip ((t (:background ,black :foreground ,white :font "Lucida Grande Mono" :height 120))))
	 `(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
	 `(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
	 `(company-tooltip-selection ((t (:background ,white :foreground ,black :font "Lucida Grande Mono" :height 120))))
	 ;; eshell
	 `(eshell-prompt ((t (:inherit default))))
	 `(font-lock-warning-face ((t (:foreground ,black :bold t :underline t))))
	 (mapcar (lambda (n) `(,n ((t (:background ,black :foreground ,white))))) jj-faces)))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'jj-dark)
;; Local Variables:
;; no-byte-compile: t
;; End:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; jj-dark.el ends here
