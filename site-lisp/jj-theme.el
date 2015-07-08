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
  (custom-theme-set-faces 'jj
   '(default ((t (:foreground "#000000" :background nil))))
   '(cursor ((t (:background "#000000" ))))
   '(mode-line ((t (:foreground "black" :background "grey75" :box nil :font "Lucida Grande" :height 120 :slant normal :weight normal))))
   '(mode-line-inactive ((t (:foreground "black" :background "grey95" :box nil :font "Lucida Grande" :height 120 :slant normal :weight light))))
   '(linum ((t (:stipple nil :background "#ffffff" :foreground "#000000" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 92 :width normal :family "Lucida Grande"))))
   '(font-lock-builtin-face ((t (:foreground "#000000" :bold nil ))))
   '(font-lock-comment-face ((t (:foreground "#000000" :slant italic :weight normal ))))
   '(font-lock-comment-delimiter-face ((t (:foreground "#000000" :slant normal))))
   '(font-lock-function-name-face ((t (:foreground "#000000" :bold nil))))
   '(font-lock-keyword-face ((t (:foreground "#000000" :weight normal))))
   '(font-lock-preprocessor-face ((t (:foreground "#000000" :bold nil))))
   '(font-lock-regexp-grouping-backslash ((t (:foreground "#000000"))))
   '(font-lock-regexp-grouping-construct ((t (:foreground "#000000"))))
   '(font-lock-string-face ((t (:foreground "#000000" ))))
   '(font-lock-type-face ((t (:foreground "#000000" :underline t :slant italic))))
   '(font-lock-constant-face ((t (:foreground "#000000" ))))
   '(font-lock-variable-name-face ((t (:foreground "#000000" ))))
   '(minibuffer-prompt ((t (:foreground "#000000" :bold t ))))
   '(org-code ((t (:foreground "#000000" :weight bold))))
   '(org-verbatim ((t (:foreground "#000000"))))
   '(org-agenda-dimmed-todo-face ((t (:inherit default :weight bold))))
   '(org-agenda-done ((t (:inherit nil :strike-through t))))
   '(org-done ((t (:weight bold :strike-through t))))
   '(org-headline-done ((((class color) (min-colors 16) (background light)) (:weigth bold :strike-through t))))
   '(org-todo ((t (:inherit default :weight bold))))
   '(ido-subdir ((t (:weight bold))))
   '(font-lock-warning-face ((t (:foreground "black" :bold t :underline t)))))

;;;###autoload
(and load-file-name
    (boundp 'custom-theme-load-path)
    (add-to-list 'custom-theme-load-path
                 (file-name-as-directory
                  (file-name-directory load-file-name))))
;; Automatically add this theme to the load path

(provide-theme 'jj)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; jj-theme.el ends here
