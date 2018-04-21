;;; jj-acme --- Personal theme
;;
;; Filename: jj-acme.el
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

(deftheme jj-acme)

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

(let ((blue "#f0ffff")
      (acme "#ffffea")
      (region "#ebea9f")
      (black "#161616")
      (black1 "#3F3F3F")
      (white "#FFFFFF"))
  (apply 'custom-theme-set-faces 'jj-acme
		 `(font-lock-function-name-face ((t (:slant normal :weight normal))))
		 `(font-lock-comment-face ((t (:slant normal :weight normal))))
		 `(font-doc-face ((t (:slant normal :weight normal))))
		 `(font-lock-warning-face ((t (:foreground ,black :background ,acme :slant normal :weight bold))))
		 `(mode-line ((t (:foreground ,black :background ,blue :box nil :slant normal :weight normal))))
		 `(mode-line-inactive ((t (:foreground ,black :background ,blue :box nil :slant normal :weight light))))
		 `(region ((t (:foreground ,black :background ,region))))
		 `(highlight ((t (:foreground , black :background ,region))))
		 `(cursor ((t (:background ,black :foreground ,white))))
		 `(org-code ((t (:foreground ,black :weight bold))))
		 `(org-verbatim ((t (:foreground ,black))))
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
		 `(ac-selection-face ((t (:background ,white :foreground ,black :bold t))))
		 `(popup-face ((t (:inherit default))))
		 `(popup-summary-face ((t (:inherit default))))
		 `(popup-menu-face ((t (:inherit default))))
		 `(popup-tip-face ((t (:background ,white :foreground ,black :bold t))))
		 ;; company
		 `(company-preview ((t (:background ,region :foreground ,black :underline t))))
		 `(company-preview-common ((t (:inherit company-preview))))
		 `(company-scrollbar-bg ((t (:background ,region :foreground ,black))))
		 `(company-scrollbar-fg ((t (:background ,black :foreground ,region))))
		 `(company-tooltip ((t (:background ,blue :foreground ,black))))
		 `(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
		 `(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
		 `(company-tooltip-selection ((t (:background ,region))))
		 `(company-tooltip-annotation ((t (:background ,blue :foreground ,black))))
		 ;; swiper
		 `(swiper-match-face-2 ((t ((:background ,blue :foreground ,black)))))
		 ;; eshell
		 `(eshell-prompt ((t (:inherit default))))
		 `(font-lock-warning-face ((t (:foreground ,black :bold t :underline t))))
		 (mapcar (lambda (n) `(,n ((t (:background ,acme :foreground ,black :width normal :weight normal))))) jj-faces)))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'jj-acme)
;; Local Variables:
;; no-byte-compile: t
;; End:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; jj-acme.el ends here
