;;; init.el --- Emacs configuration. -*- lexical-binding: t; -*-
;;
;; Filename: init.el
;; Description:
;; Author: Juan Fuentes
;; Maintainer:
;; Created: Sat Jun 28 18:48:44 2008
;; Version:
;; Package-Requires: ()
;; Last-Updated: Tue Feb  9 16:54:47 2016 (-0400)
;;           By:
;;     Update #: 95
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

;; 10MB let's see how well it works.
(setq gc-cons-threshold (* 10 1024 1024))
(add-hook 'after-init-hook (lambda ()
                             ;; restore after startup
                             (setq gc-cons-threshold 800000)))
;;; package
(autoload 'package "package" nil t)
(setq package-archives
      '(("elpa" . "https://elpa.gnu.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ("melpa" . "https://melpa.org/packages/")))

(when (<= emacs-major-version 26)
  (package-initialize))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;;; themes
(add-to-list 'custom-theme-load-path (expand-file-name (concat user-emacs-directory "themes/")))

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-tomorrow-night t))

(when (window-system)
  ;; set font
  (setenv "RIPGREP_CONFIG_PATH" (concat (getenv "HOME") "/.ripgreprc"))
  (setenv "TMPDIR" "/tmp"))

;; Load customization's
(cond ((eql system-type 'darwin)
       (setq custom-file (concat user-emacs-directory "osx-custom.el")))
      ((eql system-type 'berkeley-unix)
       (setq custom-file (concat user-emacs-directory "obsd-custom.el")))
      ((eql system-type 'gnu/linux)
       (setq custom-file (concat user-emacs-directory "linux-custom.el"))))

(if (file-exists-p custom-file)
    (load-file custom-file)
  (message (format "ERROR: custom file: %s not found or not specified" custom-file)))

;;; Server
(require 'server nil t)
(when (and (>= emacs-major-version 23) (not (server-running-p)))
  (server-start))

(add-to-list 'load-path (expand-file-name (concat user-emacs-directory "/site-lisp")))
(use-package defuns :functions init-maxframe)
(use-package global)
(use-package magit-conf)
(use-package keymaps)
(use-package windows)
(use-package utils :defer 0.4)
(use-package markdown-conf :defer 0.6)
(use-package org-conf :defer 0.5)
(use-package prog-conf)
(use-package evil-conf :disabled)
(use-package company-conf :defer 0.5)
(use-package lsp-conf :defer 0.5)
(init-maxframe)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
