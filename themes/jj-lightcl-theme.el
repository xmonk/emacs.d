;;; jj --- Personal theme
;;
;; Filename: jj-lightcl-theme.el
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

(deftheme jj-lightcl "My personal light theme with colors")

(defvar jj-faces
  `(default))

(let ((white "#FFFFFFF")
      (black "#000000")
      (sblue "#87ceeb")
      (lsblue "#87cefa"))
  (apply 'custom-theme-set-faces 'jj-lightcl
	 `(company-preview ((t (:foreground ,black :underline t))))
	 `(company-preview-common ((t (:inherit company-preview))))
	 `(company-scrollbar-bg ((t (:background ,white :foreground ,black))))
	 `(company-scrollbar-fg ((t (:background ,black :foreground ,white))))
	 `(company-tooltip ((t (:background ,white :foreground ,black))))
	 `(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
	 `(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
	 `(company-tooltip-selection ((t (:background ,lsblue :foreground ,black :weight bold))))
         ;; eshell
	 `(eshell-prompt ((t (:inherit default))))
	 (mapcar (lambda (n) `(,n ((t (:background ,white :foreground ,black))))) jj-faces)))
;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
	       (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'jj-lightcl)
;; Local Variables:
;; no-byte-compile: t
;; End:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; jj-lightcl-theme.el ends here
