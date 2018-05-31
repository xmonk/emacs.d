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
;;; themes
(add-to-list 'custom-theme-load-path (expand-file-name (concat user-emacs-directory "themes/")))
(load-theme 'doom-tomorrow-night t)

;;; frame
(unless window-system
  (menu-bar-mode -1))

(when (window-system)
  ;; set font
  (if (= 5760 (display-pixel-width))
      (set-face-attribute 'default nil :font "PragmataPro" :height (floor (* 10 9.5)))
    (set-face-attribute 'default nil :font "PragmataPro" :height (floor (* 10 11.5))))
  (setenv "RIPGREP_CONFIG_PATH" (concat (getenv "HOME") "/" ".ripgreprc"))

  (cond ((memq window-system '(mac ns))
         (dolist (mode '(scroll-bar-mode tool-bar-mode))
           (if (fboundp mode) (funcall mode -1)))
         ;; macOS sets it to /var/tmp/...
         (setenv "TMPDIR" "/tmp"))
        ((memq window-system '(x))
         (dolist (mode '(menu-bar-mode scroll-bar-mode tool-bar-mode))
           (if (fboundp mode) (funcall mode -1))))))

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

;;; ido
(require 'ido)
(setq ido-create-new-buffer (quote always))
(setq ido-enable-flex-matching t)
(setq ido-enable-prefix nil)
(setq ido-enable-regexp t)
(setq ido-max-prospects 7)
(setq ido-use-filename-at-point (quote guess))
(setq ido-use-virtual-buffers t)
(setq ido-work-directory-match-only t)
(ido-mode t)
(ido-everywhere 1)

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
(use-package markdown-conf)
(use-package org-conf)
(use-package company-conf)
(use-package evil-conf :disabled)
(use-package prog-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
