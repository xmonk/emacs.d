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

(defvar jj--file-name-handler-alist file-name-handler-alist)
(defvar jj--gc-cons-threshold gc-cons-threshold)
(defvar jj--gc-cons-precentage gc-cons-percentage)

(setq file-name-handler-alist nil)
(setq gc-cons-threshold 402653184)
(setq gc-cons-percentage 0.6)

(add-hook 'emacs-startup-hook (lambda ()
                                ;; restore after startup
                                (setq gc-cons-threshold jj--gc-cons-threshold)
                                (setq gc-cons-percentage jj--gc-cons-precentage)
                                ;; disable menu-bar in console.
                                (when (eql window-system nil)
                                  (menu-bar-mode -1))))

;;; themes
(add-to-list 'custom-theme-load-path (expand-file-name (concat user-emacs-directory "themes/")))
(add-to-list 'custom-theme-load-path (expand-file-name (concat user-emacs-directory "themes/naysayer-theme")))
(load-theme 'naysayer t)

;;; package
(autoload 'package "package" nil t)

(setq package-archives
      '(("elpa" . "https://elpa.gnu.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ("melpa" . "https://melpa.org/packages/")))

(setq package-enable-at-startup t)
(if (>= emacs-major-version 27)
    (setq package-quickstart t)
  (package-initialize))


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; Load customization's
(setq custom-file (concat user-emacs-directory "custom.el"))
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
(use-package utils)
(use-package markdown-conf :defer 0.6)
(use-package org-conf :defer 0.5)
(use-package prog-conf)
(use-package company-conf :defer 0.5)
(use-package lsp-conf :defer 0.5)

(add-hook 'emacs-startup-hook
          '(lambda ()
             (setq file-name-handler-alist jj--file-name-handler-alist)
             (when (window-system)
               ;; set font
               (setenv "RIPGREP_CONFIG_PATH" (concat (getenv "HOME") "/.ripgreprc"))
               (setenv "TMPDIR" "/tmp")
               (setenv "RUST_SRC_PATH" (concat (getenv "HOME") "/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"))
               (toggle-frame-maximized))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
