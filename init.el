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

;; In os x there is an issue with tramp and TMPDIR, this is a work around.
(if running-apple
    (setenv "TMPDIR" "/tmp"))

(unless window-system
  (menu-bar-mode -1))

(dolist (mode '(scroll-bar-mode tool-bar-mode))
  (if (fboundp mode) (funcall mode -1)))

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
    (setq exec-path (split-string path ":"))))

;; package
(autoload 'package "package" nil t)

(setq package-archives
      '(("gnu"   . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")))

(package-initialize)

(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

(defvar use-package-verbose t)
(require 'use-package)

(add-to-list 'load-path (expand-file-name *site-lisp*))
(mapc (lambda (lib)
        (require lib nil t))
      '(defuns global elisp-conf c-conf
         go-conf lisp-conf magit-conf
         org-conf py-conf keymaps
         ocaml-conf))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
