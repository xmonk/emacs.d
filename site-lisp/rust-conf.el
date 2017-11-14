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
  :if (file-directory-p "~/.cargo")
  :commands rust-mode
  :ensure t
  :config
  (setq rustfmt-enable-on-save t)
  (use-package racer
    :ensure t
    :after rust-mode
    :init
    (add-hook 'rust-mode-hook #'racer-mode)
    (add-hook 'racer-mode-hook #'eldoc-mode)
    (eval-after-load "company"
      (add-hook 'racer-mode-hook #'company-mode))
    :config
    (setq racer-cmd (concat (getenv "HOME") "/.cargo/bin/racer"))
    (setq racer-rust-src-path (concat (getenv "HOME") "/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"))
    (setq company-tooltip-align-annotations t))

  (use-package flycheck-rust
    :ensure t
    :after rust-mode
    :init
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

  (use-package cargo
    :ensure t
    :after rust-mode
    :init
    (add-hook 'rust-mode-hook 'cargo-minor-mode)))

(provide 'rust-conf)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; rust-conf.el ends here
