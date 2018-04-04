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
   '("1f1ded5a5dfda5b9da339ae7ce49d41c470cbc34099f9bdb9342c0183ab49ff1" default))
 '(dired-async-mode t)
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(flycheck-python-pyflakes-executable "pyflakes")
 '(gnutls-trustfiles
   '("/etc/ssl/ca-bundle.pem" "/usr/local/etc/openssl/cert.pem" "~/.certs/ca-certificates.pem"))
 '(grep-command "/usr/local/bin/rg")
 '(grep-find-command '("find . -type f -exec /usr/local/bin/rg \\{\\} +" . 39))
 '(grep-find-template
   "find <D> <X> -type f <F> -exec /usr/local/bin/rg -e <R> \\{\\} +")
 '(grep-highlight-matches 'always)
 '(grep-program (executable-find "rg") t)
 '(indent-tabs-mode t)
 '(magit-item-highlight-face nil)
 '(package-enable-at-startup t)
 '(package-quickstart t)
 '(package-selected-packages
   '(diminish org elisp-slime-nav irony anaconda-mode go-mode flycheck company xcscope web-mode use-package undo-tree smartscan py-yapf projectile paredit ob-go markdown-mode magit irony-eldoc ibuffer-vc go-rename go-guru go-errcheck go-eldoc git-timemachine flx-ido expand-region company-irony-c-headers company-irony company-go company-flx company-anaconda codesearch browse-kill-ring))
 '(projectile-globally-ignored-directories
   '(".idea" ".ensime_cache" ".eunit" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" "elpa" "venv" ".egg*" "__pycache__" "var" "etc"))
 '(projectile-globally-ignored-files '("TAGS" ".DS_Store" ".elc" ".pyc"))
 '(slime-company-completion 'fuzzy)
 '(temporary-file-directory "/tmp")
 '(tramp-syntax 'default nil (tramp)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eshell-prompt ((t (:inherit default))))
 '(sp-pair-overlay-face ((t nil))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; osx-custom.el ends here
