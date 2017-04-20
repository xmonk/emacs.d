;;; init.el --- Emacs configuration.
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

(autoload 'debug "debug" "emacs debugger")
(setq debug-on-error nil)

;; set faces
;; themes
(add-to-list 'custom-theme-load-path (expand-file-name (concat user-emacs-directory "themes/")))
(set-face-attribute 'default nil :background "#000000" :foreground "#C7C7C7" :font "SF Mono Medium" :height 130 :slant 'normal :weight 'normal)

(defvar *site-lisp* (concat user-emacs-directory "site-lisp/")
  "Location of configuration files to be loaded at start up.")

(defvar *vendor* (concat user-emacs-directory "vendor/")
  "Location of third-party files to be loaded at start up.")

;; 20MB let's see how well it works.
(setq gc-cons-threshold 20000000)

(unless window-system
  (menu-bar-mode -1))

;; frame
(when (memq window-system '(mac ns))
  (dolist (mode '(scroll-bar-mode tool-bar-mode))
    (if (fboundp mode) (funcall mode -1)))

  (cond ((boundp 'mac-option-modifier)
	 (setq mac-option-modifier 'meta))
	((boundp 'mac-command-modifier)
	 (setq mac-command-modifier 'super)))
  (setq mac-allow-anti-aliasing t)
  (setenv "TMPDIR" "/tmp") ;; os x sets it to /var/tmp/...
  (let ((path (shell-command-to-string "$SHELL -cl \"printf %s \\\"\\\$PATH\\\"\"")))
    (setenv "PATH" path)
    (setq exec-path (split-string path path-separator))))

;; Load customization's
(cond ((eql system-type 'darwin)
       (setq custom-file (concat user-emacs-directory "osx-custom.el")))
      ((eql system-type 'berkeley-unix)
       (setq custom-file (concat user-emacs-directory "obsd-custom.el")))
      ((eql system-type 'gnu/linux)
       (setq custom-file (concat user-emacs-directory "linux-custom.el"))))

(if (file-exists-p custom-file)
    (load-file custom-file)
  (message "ERROR: No custom file found or specified"))

;; ido
(ido-mode t)
(ido-everywhere 1)

;;; Server
(require 'server nil t)
(when (and (>= emacs-major-version 23) (not (server-running-p)))
  (server-start))

;; package
(autoload 'package "package" nil t)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
 (require 'use-package))
(defvar use-package-verbose nil)

(add-to-list 'load-path (expand-file-name *site-lisp*))
(use-package defuns
  :config
  (init-maxframe))
(use-package global)
(use-package keymaps)
(use-package cedet-conf :defer t)
(use-package elisp-conf)
(use-package lisp-conf)
(use-package magit-conf)
(use-package c-conf)
(use-package go-conf)
(use-package org-conf)
(use-package py-conf)
(use-package eshell-conf)
(use-package ocaml-conf
  :disabled
  :if (file-directory-p (concat (getenv "HOME") "/.opam"))
  :config
  (load (concat (getenv "HOME") "/.opam/system/share/emacs/site-lisp/tuareg-site-file")))
(use-package rust-conf :disabled)
(use-package slime-conf :disabled)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
