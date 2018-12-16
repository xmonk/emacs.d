;;; jj --- Personal theme
;;
;; Filename: jj-darkcl-theme.el
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

(deftheme jj-darkcl "My personal dark theme with colors")

(defvar jj-faces
  `(default))

(defvar darkcl-company-fontsize 130)

(let ((white "#c5c8c6")
      (black "#1d1f21")
      (fontsize darkcl-company-fontsize))

  (apply 'custom-theme-set-faces 'jj-darkcl
		     `(highlight ((t (:background "gray72" :foreground "black" :weight bold))))
		     `(region ((t (:background "#525353" :foreground ,white))))
		     `(company-preview ((t (:foreground ,white ::underline t :height ,fontsize))))
		     `(company-preview-common ((t (:inherit company-preview))))
		     `(company-scrollbar-bg ((t (:background ,black :foreground ,white))))
		     `(company-scrollbar-fg ((t (:background ,white :foreground ,black))))
		     `(company-tooltip ((t (:background ,black :foreground ,white :height ,fontsize))))
		     `(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
		     `(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
		     `(company-tooltip-selection ((t (:background ,white :foreground ,black :height ,fontsize))))
		     `(company-tooltip-annotation ((t (:foreground "gray31" :weight bold))))
         ;; eshell
		     `(eshell-prompt ((t (:inherit default))))
		     (mapcar (lambda (n) `(,n ((t (:background ,black :foreground ,white))))) jj-faces)))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
			         (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'jj-darkcl)
;; Local Variables:
;; no-byte-compile: t
;; End:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; jj-darkcl-theme.el ends here
