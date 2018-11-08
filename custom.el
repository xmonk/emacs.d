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
 '(column-number-mode t)
 '(compilation-message-face 'default)
 '(counsel-mode t)
 '(dired-async-mode t)
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(enable-recursive-minibuffers t)
 '(eshell-destroy-buffer-when-process-dies t)
 '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
 '(flycheck-flake8rc "/Users/jj/.config/flake8")
 '(flycheck-python-flake8-executable "/Users/jj/.pyenv/shims/flake8")
 '(flycheck-python-pyflakes-executable "pyflakes")
 '(frame-background-mode 'dark)
 '(gdb-many-windows t t)
 '(gdb-show-main t t)
 '(gnutls-trustfiles
   '("/etc/ssl/ca-bundle.pem" "/usr/local/etc/openssl/cert.pem" "~/.certs/ca-certificates.pem"))
 '(grep-command "/usr/local/bin/rg")
 '(grep-find-command '("find . -type f -exec /usr/local/bin/rg \\{\\} +" . 39))
 '(grep-find-template
   "find <D> <X> -type f <F> -exec /usr/local/bin/rg -e <R> \\{\\} +")
 '(grep-highlight-matches 'always)
 '(grep-program (executable-find "rg") t)
 '(indent-tabs-mode t)
 '(ivy-count-format "(%d/%d) ")
 '(ivy-display-style 'fancy)
 '(ivy-use-virtual-buffers t)
 '(ivy-virtual-abbreviate 'full)
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   '(auto-virtualenv eyebrowse smart-jump auto-virtualenvwrapper company-quickhelp company-racer cargo racer flycheck-rust rust-mode company-ycmd ycmd dumb-jump ivy-xref ivy-rich night-owl counsel counsel-gtags counsel-projectile counsel-pydoc swiper ggtags deadgrep ace-window exec-path-from-shell doom-themes whole-line-or-region yaml-mode magithub flycheck-irony cmake-mode edit-indirect clang-format diminish org elisp-slime-nav irony go-mode flycheck company xcscope web-mode use-package undo-tree py-yapf projectile paredit markdown-mode magit irony-eldoc ibuffer-vc go-rename go-guru go-errcheck go-eldoc git-timemachine expand-region company-irony-c-headers company-irony company-go company-flx browse-kill-ring))
 '(projectile-globally-ignored-directories
   '(".idea" ".ensime_cache" ".eunit" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" "elpa" "venv" ".egg*" "__pycache__" "var" "etc"))
 '(projectile-globally-ignored-files '("TAGS" ".DS_Store" ".elc" ".pyc"))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(slime-company-completion 'fuzzy)
 '(temporary-file-directory "/tmp")
 '(tool-bar-mode nil)
 '(tramp-syntax 'default nil (tramp))
 '(use-package-compute-statistics nil)
 '(use-package-verbose t)
 '(vc-annotate-background nil)
 '(vc-annotate-very-old-color nil)
 '(vc-follow-symlinks t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eshell-prompt ((t (:inherit default))))
 '(sp-pair-overlay-face ((t nil))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; osx-custom.el ends here
