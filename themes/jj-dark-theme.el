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
     font-lock-preprocessor-face
     font-lock-regexp-grouping-backslash
     font-lock-regexp-grouping-construct
     font-lock-string-face
     font-lock-type-face
     font-lock-variable-name-face
     font-lock-warning-face
     fringe
     mode-line))

(defvar dark-company-fontsize 100)

(let ((white "#c5c8c6")
      (black "#1d1f21")
      (fontsize dark-company-fontsize))

  (apply 'custom-theme-set-faces 'jj-dark
         `(highlight ((t (:background "gray72" :foreground ,black :weight bold))))
         `(region ((t (:background "#525353" :foreground ,white))))
         `(font-lock-function-name-face ((t (:slant normal :weight normal))))
         `(font-lock-comment-face ((t (:slant normal :weight normal))))
         `(font-doc-face ((t (:slant normal :weight normal))))
         `(mode-line ((t (:foreground ,black :background ,white :box nil :slant normal :weight normal))))
         `(mode-line-inactive ((t (:foreground ,black :background ,white :box nil :slant normal :weight light))))
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
         ;; diff
         `(diff-header ((t (:foreground ,white))))
         `(diff-file-header ((t (:background ,black))))
         `(diff-hunk-header ((t (:background ,black :foreground ,white))))
         `(diff-hunk-text ((t (:foreground ,black))))
         `(diff-added ((t (:foreground ",white"))))
         `(diff-removed ((t (:foreground "gray72"))))
         ;; auto-complete
         `(ac-completion-face ((t (:background ,black :foreground ,white))))
         `(ac-candidate-face ((t (:background ,black :foreground ,white))))
         `(ac-selection-face ((t (:background ,white :foreground ,black :bold t))))
         `(popup-face ((t (:inherit default))))
         `(popup-summary-face ((t (:inherit default))))
         `(popup-menu-face ((t (:inherit default))))
         `(popup-tip-face ((t (:background ,white :foreground ,black :bold t))))
         ;; company
         `(company-preview ((t (:foreground ,white :underline t :height ,fontsize))))
         `(company-preview-common ((t (:inherit company-preview))))
         `(company-scrollbar-bg ((t (:background ,black :foreground ,white))))
         `(company-scrollbar-fg ((t (:background ,white :foreground ,black))))
         `(company-tooltip ((t (:background ,black :foreground ,white))))
         `(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
         `(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
         `(company-tooltip-selection ((t (:background ,white :foreground ,black))))
         `(company-tooltip-annotation ((t (:foreground "gray31" :weight bold :height ,fontsize))))
         ;; ivy
         ;; `(ivy-current-match ((t (:background "gray31" :foreground ,white :bold t))))
         ;; `(ivy-minibuffer-match-face-1 ((t (:background "gray31" :foreground "#F8f8f8" :bold t))))
         ;; `(ivy-minibuffer-match-face-2 ((t (:foreground ,white :bold t))))
         ;; `(ivy-minibuffer-match-face-3 ((t (:foreground "lightblue" :bold t))))
         ;; `(ivy-minibuffer-match-face-4 ((t (:foreground ,white :bold t))))
         ;; eshell
         `(eshell-prompt ((t (:inherit default))))
         `(font-lock-warning-face ((t (:background ,black :foreground ,white :bold t :underline t))))
         (mapcar (lambda (n) `(,n ((t (:background ,black :foreground ,white :width normal :weight normal))))) jj-faces)))

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
