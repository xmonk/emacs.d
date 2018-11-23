;;; custom.el --- Custom file.
;;
;; Filename: custom.el
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
 '(clang-format-style
   "{BasedOnStyle: llvm, UseTab: Always, IndentWidth: 8, AllowShortFunctionsOnASingleLine: None, KeepEmptyLinesAtTheStartOfBlocks: false}" t)
 '(column-number-mode t)
 '(compilation-message-face 'default)
 '(counsel-mode t)
 '(dired-async-mode t)
 '(ecb-options-version "2.50")
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(enable-recursive-minibuffers t)
 '(fci-rule-color "#010F1D")
 '(flycheck-flake8rc "/home/jfuentes/.config/flake8")
 '(flycheck-python-flake8-executable "/home/jfuentes/.pyenv/shims/flake8")
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
 '(ivy-count-format "(%d/%d) ")
 '(ivy-display-style 'fancy)
 '(ivy-use-virtual-buffers t)
 '(ivy-virtual-abbreviate 'full)
 '(magit-diff-use-overlays nil)
 '(magit-item-highlight-face nil)
 '(magit-repository-directories
   '(("~/w/moosetalk-web")
     ("~/w/moosetalk-infra")
     ("~/.files")
     ("~/.emacs.d/" . 0)
     ("~/.emacs.d/lib/" . 1)))
 '(menu-bar-mode nil)
 '(network-security-level 'high)
 '(package-selected-packages
   '(docker eglot eyebrowse smart-jump pythonic auto-virtualenv company-tern docker-compose-mode dockerfile-mode tern blacken flycheck-ycmd org counsel-etags ecb sr-speedbar company-racer racer cargo flycheck-rust rust-mode json-mode company-ycmd ycmd alert magit-todos dumb-jump ob-restclient ivy-xref ivy-rich deadgrep counsel counsel-gtags counsel-projectile counsel-pydoc ggtags restclient spinner lsp-imenu
            (lsp-mode lsp-ui company-lsp)
            exec-path-from-shell eybrowse ace-window pylint doom-themes lua-mode whole-line-or-region yaml-mode edit-indirect xcscope web-mode use-package undo-tree swiper smartscan projectile paredit ob-go markdown-mode magit irony-eldoc ibuffer-vc go-rename go-guru go-errcheck go-eldoc git-timemachine flycheck flx-ido expand-region elisp-slime-nav diminish company-irony-c-headers company-irony company-go company-flx codesearch clang-format browse-kill-ring))
 '(pos-tip-background-color "#FFF9DC")
 '(pos-tip-foreground-color "#011627")
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
 '(vc-annotate-color-map
   '((20 . "#C792EA")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#FFEB95")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#F78C6C")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#7FDBCA")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#82AAFF")))
 '(vc-annotate-very-old-color nil)
 '(vc-follow-symlinks t)
 '(xterm-mouse-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eshell-prompt ((t (:inherit default))))
 '(sp-pair-overlay-face ((t nil))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; custom.el ends here
