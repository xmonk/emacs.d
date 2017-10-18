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

;; set faces
;; themes
(add-to-list 'custom-theme-load-path (expand-file-name (concat user-emacs-directory "themes/")))
(load-theme 'jj-light t)

(unless window-system
  (menu-bar-mode -1))

;; frame
(when (memq window-system '(mac ns))
  (set-face-attribute 'default nil :font "Lucida Grande Mono" :height 130)
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
(require 'ido)
(setq ido-create-new-buffer (quote always))
(setq ido-enable-flex-matching t)
(setq ido-enable-prefix nil)
(setq ido-enable-regexp t)
(setq ido-max-prospects 7)
(setq ido-use-filename-at-point (quote guess))
(setq ido-use-virtual-buffers nil)
(setq ido-work-directory-match-only t)
(ido-mode t)
(ido-everywhere 1)

;;; Server
(require 'server nil t)
(when (and (>= emacs-major-version 23) (not (server-running-p)))
  (server-start))

;; package
(autoload 'package "package" nil t)

(setq package-archives
      '(("elpa" . "https://elpa.gnu.org/packages/")
	("melpa" . "https://melpa.org/packages/")))
(package-initialize)
(setq package-enable-at-startup nil)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(defvar use-package-verbose t)

(add-to-list 'load-path (expand-file-name (concat user-emacs-directory "/site-lisp")))
(use-package defuns)
(use-package global :after defuns)
(use-package keymaps)
(use-package cedet-conf :defer t)
(use-package elisp-conf)
(use-package lisp-conf)
(use-package magit-conf)
(use-package c-conf)
(use-package go-conf)
(use-package org-conf)
(use-package py-conf)
(use-package sh-conf)
(use-package eshell-conf)
(use-package ocaml-conf)
(use-package rust-conf)
;; resize frame
(init-maxframe)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
