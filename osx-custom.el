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
 '(package-selected-packages
   '(magithub pipenv flycheck-irony cmake-mode edit-indirect clang-format diminish org elisp-slime-nav irony anaconda-mode go-mode flycheck company xcscope web-mode use-package undo-tree py-yapf projectile paredit markdown-mode magit irony-eldoc ibuffer-vc go-rename go-guru go-errcheck go-eldoc git-timemachine flx-ido expand-region company-irony-c-headers company-irony company-go company-flx company-anaconda codesearch browse-kill-ring))
 '(slime-company-completion 'fuzzy)
 '(temporary-file-directory "/tmp")
 '(tramp-syntax 'default nil (tramp))
 '(vc-follow-symlinks t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
  '(sp-pair-overlay-face ((t nil))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; osx-custom.el ends here
