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
  :init
  (add-hook 'rust-mode-hook #'rustfmt-enable-on-save)
  :config
  (use-package rustfmt
    :ensure t)

  (setq rustfmt-bin (concat (getenv "HOME") "/.cargo/bin/rustfmt"))
  (define-key rust-mode-map (kbd "C-c C-f") #'rustfmt-format-buffer)
  (use-package racer
    :init
    (add-hook 'race-mode-hook #'company-mode)
    (add-hook 'rust-mode-hook #'racer-mode)
    (setq racer-cmd (concat (getenv "HOME") "/.cargo/bin/racer"))
    (setq racer-rust-src-path (concat (getenv "HOME") "/r/rust/src"))
    (setq company-tooltip-align-annotations t)))


(provide 'rust-conf)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; rust-conf.el ends here
