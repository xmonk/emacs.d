;;; osx-custom.el ---  OS X custom file.
;;
;; Filename: osx-custom.el
;; Description:
;; Author: Juan Fuentes
;; Maintainer:
;; Created: Fri Aug 21 09:14:29 2015 (-0400)
;; Version:
;; Package-Requires: ()
;; Last-Updated:
;;           By:
;;     Update #: 9
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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("1f1ded5a5dfda5b9da339ae7ce49d41c470cbc34099f9bdb9342c0183ab49ff1" default)))
 '(dired-async-mode t)
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(flycheck-python-pyflakes-executable "pyflakes")
 '(gnutls-trustfiles
   (quote
	("/etc/ssl/ca-bundle.pem" "/usr/local/etc/openssl/cert.pem" "~/.certs/ca-certificates.pem")))
 '(grep-program (executable-find "rg") t)
 '(indent-tabs-mode t)
 '(magit-item-highlight-face nil)
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
	(exec-path-from-shell org elisp-slime-nav php-mode irony anaconda-mode go-mode flycheck company fish-mode xcscope web-mode use-package undo-tree swiper smartscan racer py-yapf projectile paredit ob-go markdown-mode magit irony-eldoc ibuffer-vc go-rename go-guru go-errcheck go-eldoc git-timemachine flycheck-rust flx-ido expand-region company-irony-c-headers company-irony company-go company-flx company-anaconda codesearch cargo browse-kill-ring)))
 '(projectile-globally-ignored-directories
   (quote
	(".idea" ".ensime_cache" ".eunit" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" "elpa" "venv" ".egg*" "__pycache__" "var" "etc")))
 '(projectile-globally-ignored-files (quote ("TAGS" ".DS_Store" ".elc" ".pyc")))
 '(slime-company-completion (quote fuzzy))
 '(temporary-file-directory "/tmp")
 '(tramp-syntax (quote default) nil (tramp)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eshell-prompt ((t (:inherit default))))
 '(sp-pair-overlay-face ((t nil))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; osx-custom.el ends here
