;;; elisp-conf.el --- Emacs Lisp configuration
;;
;; Filename: elisp-conf.el
;; Description:
;; Author: Juan Fuentes
;; Maintainer:
;; Created: Tue Jun 10 18:00:20 2008 (-0400)
;; Version:
;; Package-Requires: ()
;; Last-Updated: Sat Apr 18 14:09:07 2015 (-0400)
;;           By:
;;     Update #: 25
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

(load-after emacs-lisp-mode
  (if (string-equal buffer-file-name (expand-file-name user-init-file))
      (add-hook 'after-save-hook 'compile-init-file t t))
  (load-after auto-complete
    (bind-key "C-c <tab>" 'auto-complete emacs-lisp-mode-map)
    (add-hook 'emacs-lisp-mode-hook 'auto-complete-mode)
    (add-hook 'lisp-interaction-mode-hook 'auto-complete-mode))
  (add-hook 'after-save-hook 'check-parens))

(provide 'elisp-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; elisp-conf.el ends here
