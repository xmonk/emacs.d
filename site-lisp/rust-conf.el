;;; rust-conf.el --- Rust configuration
;;
;; Filename: rust-conf.el
;; Description:
;; Author: Juan Fuentes
;; Maintainer:
;; Created: Thu May  5 16:49:15 2016 (-0400)
;; Version:
;; Package-Requires: ()
;; Last-Updated:
;;           By:
;;     Update #: 4
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

(use-package rust-mode
  :ensure t
  :config
  (use-package rustfmt :ensure t)

  (setq rustfmt-bin (concat (getenv "HOME") "/.cargo/bin/rustfmt"))
  (define-key rust-mode-map (kbd "C-c C-f") #'rustfmt-format-buffer)
  (add-hook 'rust-mode-hook #'rustfmt-enable-on-save))


(provide 'rust-conf)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; rust-conf.el ends here
