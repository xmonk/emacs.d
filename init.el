;;; init.el --- Emacs configuration.
;;
;; Filename: init.el
;; Description:
;; Author: Juan Fuentes
;; Maintainer:
;; Created: Sat Jun 28 18:48:44 2008
;; Version:
;; Package-Requires: ()
;; Last-Updated: Sat Apr 18 14:22:27 2015 (-0400)
;;           By:
;;     Update #: 92
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

(require 'debug)
(setq debug-on-error nil)

(defvar *site-lisp* (concat user-emacs-directory "site-lisp/")
  "Location of configuration files to be loaded at start up.")

(defvar *vendor* (concat user-emacs-directory "vendor/")
  "Location of third-party files to be loaded at start up.")

(defvar running-apple (string-match "apple" system-configuration))

;; 20MB let's see how well it works.
(setq gc-cons-threshold 20000000)

(unless window-system
  (menu-bar-mode -1))

(dolist (mode '(scroll-bar-mode tool-bar-mode))
  (if (fboundp mode) (funcall mode -1)))

;; set faces
(set-face-attribute 'default nil :background "black" :foreground "gray" :font "Lucida Grande Mono" :height 120 :slant 'normal :weight 'normal)
(set-face-attribute 'mode-line nil :box nil :font "Lucida Grande" :height 120 :slant 'normal :weight 'normal)
(set-face-attribute 'font-lock-comment-face nil :font "Lucida Grande" :height 130 :slant 'italic :weight 'normal)
(set-face-attribute 'font-lock-doc-face nil :font "Lucida Grande" :height 130 :slant 'normal :weight 'normal)
(set-face-attribute 'font-lock-function-name-face nil :font "Lucida Grande" :height 130 :slant 'normal :weight 'normal)

;; In os x there is an issue with tramp and TMPDIR, this is a work around.
(if running-apple
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
  (message "ERROR: No custom file found or specified"))

;; set exec-path
(when (eq window-system 'ns)
  (let ((path (shell-command-to-string "$SHELL -cl \"printf %s \\\"\\\$PATH\\\"\"")))
    (setenv "PATH" path)
    (setq exec-path (split-string path path-separator))))

;;; Server
(require 'server nil t)
(when (and (>= emacs-major-version 23) (not (server-running-p)))
  (server-start))

;; package
(autoload 'package "package" nil t)

(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

(defvar use-package-verbose t)
(require 'use-package)

(add-to-list 'load-path (expand-file-name *site-lisp*))
(mapc (lambda (lib)
        (require lib nil t))
      '(defuns global elisp-conf c-conf go-conf lisp-conf
         magit-conf org-conf py-conf keymaps
         ocaml-conf java-conf))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
