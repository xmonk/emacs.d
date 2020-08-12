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

;;; themes
(add-to-list 'custom-theme-load-path (expand-file-name (concat user-emacs-directory "themes/")))
(add-to-list 'custom-theme-load-path (expand-file-name (concat user-emacs-directory "themes/naysayer-theme")))
(add-to-list 'custom-theme-load-path (expand-file-name (concat user-emacs-directory "themes/tron-legacy-emacs-theme")))
(load-theme 'jj-dark t)

;; Load customization's
(setq custom-file (concat user-emacs-directory "custom.el"))
(if (file-exists-p custom-file)
    (load-file custom-file)
  (message (format "ERROR: custom file: %s not found or not specified" custom-file)))

(add-to-list 'load-path (expand-file-name (concat user-emacs-directory "/site-lisp")))
(use-package defuns)
(use-package global)
(use-package magit-conf)
(use-package keymaps)
(use-package windows)
(use-package utils)
(use-package paredit-conf)
(use-package c-conf :defer 0.8)
(use-package elisp-conf)
(use-package lisp-conf :defer 1)
(use-package go-conf :defer 0.8)
(use-package org-conf :defer 0.8)
(use-package py-conf :defer 0.8)
(use-package sh-conf :defer 0.8)
(use-package eshell-conf :defer 1)
(use-package ocaml-conf :when (file-directory-p (expand-file-name "~/.opam")) :defer 1)
(use-package rust-conf :when (file-directory-p (expand-file-name "~/.cargo")) :defer 1)
(use-package path-conf :defer 0.5)
(use-package markdown-conf :defer 0.8)
(use-package org-conf :defer 0.8)
(use-package prog-conf :defer 0.5)
(use-package company-conf :defer 0.5)
(use-package lsp-conf :defer 1)
(use-package vterm-conf)
(use-package cfn-conf :defer 0.5)

;;; Server
(require 'server nil t)
(when (and (>= emacs-major-version 23) (not (server-running-p)))
  (server-start))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
