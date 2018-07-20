;;; linux-custom.el --- Linux custom file.
;;
;; Filename: linux-custom.el
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
;; Keywords:;; Compatibility:
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
 '(ansi-term-color-vector
   [unspecified "#1d1f21" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#b294bb" "#81a2be" "#c5c8c6"] t)
 '(clang-format-style
   "{BasedOnStyle: llvm, UseTab: Always, IndentWidth: 8, AllowShortFunctionsOnASingleLine: None, KeepEmptyLinesAtTheStartOfBlocks: false}" t)
 '(column-number-mode t)
 '(dired-async-mode t)
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(flycheck-flake8rc (expand-file-name "~/.config/flake8"))
 '(flycheck-python-flake8-executable (expand-file-name "~/.local/bin/flake8"))
 '(flycheck-python-pycompile-executable "python3")
 '(flycheck-python-pyflakes-executable "pyflakes")
 '(gdb-many-windows t t)
 '(gdb-show-main t t)
 '(grep-command "/usr/bin/rg")
 '(grep-find-command '("find . -type f -exec /usr/bin/rg \\{\\} +" . 39))
 '(grep-find-template
   "find <D> <X> -type f <F> -exec /usr/bin/rg -e <R> \\{\\} +")
 '(grep-highlight-matches 'always)
 '(grep-program (executable-find "rg") t)
 '(indent-tabs-mode t)
 '(magit-item-highlight-face nil)
 '(menu-bar-mode t)
 '(network-security-level 'high)
 '(package-selected-packages
   '(deadgrep auto-virtualenvwrapper counsel counsel-gtags counsel-projectile counsel-pydoc night-owl-theme ggtags restclient spinner lsp-imenu company-lsp lsp-ui lsp-mode
              (lsp-mode lsp-ui company-lsp)
              exec-path-from-shell eybrowse ace-window pylint doom-themes lua-mode whole-line-or-region yaml-mode edit-indirect xcscope web-mode use-package undo-tree swiper smartscan py-yapf projectile paredit org ob-go markdown-mode magit irony-eldoc ibuffer-vc go-rename go-guru go-errcheck go-eldoc git-timemachine flycheck flx-ido expand-region elisp-slime-nav diminish company-irony-c-headers company-irony company-go company-flx company-anaconda codesearch clang-format browse-kill-ring))
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
 '(vc-follow-symlinks t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "PragmataPro Mono" :foundry "fsdf" :slant normal :weight normal :height 90 :width normal))))
 '(eshell-prompt ((t (:inherit default))))
 '(sp-pair-overlay-face ((t nil))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; linux-custom.el ends here
