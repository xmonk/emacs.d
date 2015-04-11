;;; init.el ---
;;
;; Filename: init.el
;; Description:
;; Author: Juan Fuentes
;; Maintainer:
;; Copyright © Juan Julio Fuentes
;; Created: Sat Jun 28 18:48:44 2008
;; Version:
;; Last-Updated: Wed Apr  1 19:27:09 2015 (-0400)
;;           By:
;;     Update #: 88
;; URL:
;; Keywords:
;; Compatibility:
;;
;;; Code:

(require 'debug)
(setq debug-on-error nil)

(defvar *site-lisp* (concat user-emacs-directory "site-lisp/")
  "Location of configuration files to be loaded at start up.")

(defvar *vendor* (concat user-emacs-directory "vendor/")
  "Location of third-party files to be loaded at start up.")

(defvar running-apple (string-match "apple" system-configuration))

;; 20mb let's see how well it works.
(setq gc-cons-threshold 20000000)

;; In os x there is an issue with tramp and TMPDIR, this is a work around.
(if running-apple
    (setenv "TMPDIR" "/tmp"))

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

(use-package exec-path-from-shell
  :ensure t
  :commands exec-path-from-shell-initialize
  :config
  (dolist (var '("GOROOT" "GOPATH" "OCAML_TOPLEVEL_PATH" "SSH_AUTH_SOCK" "SSH_AGENT_PID" "GPG_AGENT_INFO"))
    (add-to-list 'exec-path-from-shell-variables var)))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Load customizations
(cond ((eql system-type 'darwin)
       (setq custom-file (concat user-emacs-directory "osx-custom.el")))
      ((eql system-type 'berkeley-unix)
       (setq custom-file (concat user-emacs-directory "obsd-custom.el")))
      ((eql system-type 'gnu/linux)
       (setq custom-file (concat user-emacs-directory "linux-custom.el"))))

(if (file-exists-p custom-file)
    (load-file custom-file)
  (message "ERROR: No custom file found or specified"))

(add-to-list 'load-path (expand-file-name *site-lisp*))
(mapc (lambda (lib)
        (require lib nil t))
      '(defuns frames global ido-conf ibuffer-conf
         elisp-conf c-conf ac-conf smartparens-conf
         eshell-conf go-conf lisp-conf magit-conf
         org-conf py-conf emacsd-tile sh-conf helm-conf
         tramp-conf keymaps aliases pl-conf scala-conf
         ocaml-conf julia-conf slime-conf nxml-conf))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
