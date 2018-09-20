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
  :commands rust-mode
  :ensure t
  :init
  (setq rustfmt-enable-on-save t))

(use-package flycheck-rust
  :ensure t
  :after rust-mode
  :init
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(use-package cargo
  :ensure t
  :after rust-mode
  :init
  (add-hook 'rust-mode-hook 'cargo-minor-mode))

(use-package racer
  :ensure t
  :after rust-mode
  :init
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode)
  (setq racer-cmd (concat (getenv "HOME") "/.cargo/bin/racer"))
  (setq racer-rust-src-path (concat (getenv "HOME") "/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src")))

(use-package company-racer
  :when (file-executable-p (expand-file-name "~/.cargo/bin/racer"))
  :ensure t
  :after racer-mode)

(provide 'rust-conf)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; rust-conf.el ends here
