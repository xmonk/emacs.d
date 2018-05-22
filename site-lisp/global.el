;;; global.el ---  Global emacs configuration. -*- lexical-binding: t; -*-
;;
;; Filename: global.el
;; Description:
;; Author: Juan Fuentes
;; Maintainer:
;; Created:  Sat Jun 28 18:48:44 2008 (-0400)
;; Version:
;; Package-Requires: ()
;; Last-Updated: Sat Apr 18 14:22:00 2015 (-0400)
;;           By:
;;     Update #: 97
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

;; stop cursor from blinking
(blink-cursor-mode -1)

;; don't scroll like a maniac
(defvar mouse-wheel-scroll-amount '(1))
(defvar mouse-wheel-progressive-speed nil)
(setq scroll-preserve-screen-position 'always)

;;; Encoding
;; utf-8
(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(setq buffer-file-coding-system 'utf-8-unix)
(setq coding-system-for-write 'utf-8-unix)
(setq coding-system-for-read 'utf-8-unix)

;; From Emacs wiki
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;;; system configuration
(setq-default kill-whole-line t)
(setq-default fill-column 100)
(setq-default transient-mark-mode t)
;; don't break lines
(setq-default truncate-lines t)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(setq inhibit-startup-echo-area-message "jj")
(setq inhibit-default-init t)
(defvar minibuffer-max-depth nil)
(defvar show-paren-delay 0)
(defvar show-paren-highlight-openparen nil)
(show-paren-mode t)
(setq version-control t)
(setq visible-bell nil)
(setq ring-bell-function 'ignore)
(setq next-line-add-newlines nil)
(setq backup-by-copying-when-linked t)
(setq search-highlight t)
(setq query-replace-highlight t)
(setq require-final-newline t)
(delete-selection-mode 1)

;; don't let the cursor go into minibuffer prompt
(setq minibuffer-prompt-properties (quote (read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt)))

;; fringe
(set-default 'indicate-empty-lines nil)
(column-number-mode)

;; seed the random-number generator
(random t)

;; Mouse copy region
(setq mouse-drag-copy-region t)

;; set-goal-column
(put 'set-goal-column 'disabled nil)

;; enable narrow-to-page, narrow-to-region
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; enable dired-find-alternate-file
(put 'dired-find-alternate-file 'disabled nil)

;; Don't ask for confirmation of new buffers.
(setq confirm-nonexistent-file-or-buffer nil)

;; add system clipboard to kill-ring
(setq save-interprogram-paste-before-kill t)

;; Ediff
(setq diff-switches "-Nu")
;; Mail related stuff.
(setq mail-user-agent (quote gnus-user-agent))
(setq read-mail-command (quote gnus))
(setq mail-yank-prefix ">")

;; If images are supported than display them when visiting them.
(when (fboundp 'auto-image-file-mode)
  (auto-image-file-mode 1))

(add-hook 'prog-mode-hook 'jj/pretty-lambdas)
(add-hook 'prog-mode-hook 'jj/local-comment-auto-fill)
(add-hook 'prog-mode-hook 'jj/add-watchwords)

;; sensible zap to char
(autoload 'zap-up-to-char "misc" "Kill up to, but not including ARGth occurrence of CHAR.")

;; Don't allow the scratch buffer to be killed. It will delete it's contents instead.
(add-hook 'kill-buffer-query-functions 'jj/immortal-scratch-buffer)

;; backtracks search to beginning of buffer.
(add-hook 'isearch-mode-end-hook 'jj/goto-match-beginning)

;; makes editing git commits less painful.
(add-hook 'git-commit-mode-hook 'disable-paredit-mode)

;;; sessions
(defvar session-save-file (concat user-emacs-directory ".session"))

;;; tramp
(defvar tramp-default-method "ssh")
(defvar tramp-ssh-controlmaster-options nil)

;;; fish
(use-package fish-mode
  :ensure t
  :commands fish-mode
  :when (and (executable-find "fish") (string= "fish" (ff-basename (getenv "SHELL")))))

(use-package fish-completion
  :ensure t
  :defer
  :when (and (executable-find "fish") (string= "fish" (ff-basename (getenv "SHELL"))))
  :init
  (fish-completion-mode))

;;; ibuffer
(use-package ibuffer
  :commands ibuffer)

(use-package ibuffer-vc
  :ensure t
  :defer
  :after ibuffer
  :functions ibuffer-do-sort-by-alphabetic
  :init
  (defun jj/ibuffer-vc-setup ()
    (ibuffer-vc-set-filter-groups-by-vc-root)
    (unless (eq ibuffer-sorting-mode 'alphabetic)
      (ibuffer-do-sort-by-alphabetic)))
  ;; make ibuffer the default
  (defalias 'list-buffers 'ibuffer)
  (add-hook 'ibuffer-hook 'jj/ibuffer-vc-setup))

;;; vc backend
(use-package vc-git
  :init
  (global-git-commit-mode t))

;;; company
(use-package company
  :ensure t
  :commands company-complete
  :bind (("C-c TAB" . company-complete))
  :diminish company-mode
  :init
  (setq company-tooltip-align-annotations t)
  (global-company-mode 1))

(use-package company-flx
  :ensure t
  :commands company-flx-mode
  :after company
  :init
  (setq company-tooltip-limit 20)
  (setq company-idle-delay .3)
  (setq company-echo-delay 0)
  (setq company-auto-complete nil)
  (setq  company-begin-commands nil)
  (setq company-minimum-prefix-length 3)
  (company-flx-mode +1)
  (add-hook 'company-mode-hook (lambda () (add-to-list 'company-backends 'company-capf))))

;;; on duplicate filenames, show path names.
(use-package uniquify
  :defer 5
  :init
  (setq uniquify-separator ":")
  (setq uniquify-after-kill-buffer-p t)
  (setq uniquify-buffer-name-style 'post-forward))

;;; recentf
(use-package recentf
  :bind (("C-x C-r" . ido-recentf-open))
  :init
  (recentf-mode t)
  (defun ido-recentf-open ()
    "Use `ido-completing-read' to \\[find-file] a recent file"
    (interactive)
    (if (find-file (ido-completing-read "Find recent file: " recentf-list))
        (message "Opening file...")
      (message "Aborting"))))

;;; paredit
(use-package paredit
  :ensure t
  :commands paredit-mode
  :diminish paredit-mode
  :config
  (bind-key "C-M-l" 'paredit-recentre-on-sexp paredit-mode-map)
  (bind-key ")" 'paredit-close-round-and-newline paredit-mode-map)
  (bind-key "M-)" 'paredit-close-round paredit-mode-map)
  (bind-key "M-k" 'paredit-raise-sexp paredit-mode-map)
  (bind-key "M-I" 'paredit-splice-sexp paredit-mode-map)
  (bind-key "<return>" 'paredit-newline paredit-mode-map)
  (unbind-key "M-r" paredit-mode-map)
  (unbind-key "M-s" paredit-mode-map)
  (unbind-key "C-j" paredit-mode-map)
  (bind-key "C-. D" 'paredit-forward-down paredit-mode-map)
  (bind-key "C-. B" 'paredit-splice-sexp-killing-backward paredit-mode-map)
  (bind-key "C-. C" 'paredit-convolute-sexp paredit-mode-map)
  (bind-key "C-. F" 'paredit-splice-sexp-killing-forward paredit-mode-map)
  (bind-key "C-. a" 'paredit-add-to-next-list paredit-mode-map)
  (bind-key "C-. A" 'paredit-add-to-previous-list paredit-mode-map)
  (bind-key "C-. j" 'paredit-join-with-next-list paredit-mode-map)
  (bind-key "C-. J" 'paredit-join-with-previous-list paredit-mode-map))

;;; cscope
(use-package xcscope
  :ensure t
  :defer
  :init
  (add-hook 'prog-mode-hook 'cscope-minor-mode)
  (setq cscope-program "cscope")
  (setq cscope-database-regexps '(("~/.cscope/")))
  (cscope-setup))

;;; diminish
(use-package diminish
  :commands diminish
  :ensure t)

(use-package eldoc
  :commands eldoc-mode
  :diminish eldoc-mode)

(use-package git-timemachine
  :ensure t
  :commands git-timemachine)

;;; undo-tree
(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :bind (("C-x u" . undo-tree-undo)
         ("s-z" . undo-tree-undo)
         ("s-r" . undo-tree-redo))
  :init
  (undo-tree-mode t)
  (global-undo-tree-mode t)
  (setq undo-tree-visualizer-relative-timestamps t)
  (setq undo-tree-visualizer-timestamps t))

;;; projectile
(use-package projectile
  :ensure t
  :diminish projectile-mode
  :bind (("C-c p p" . projectile-switch-project))
  :functions projectile-relevant-known-projects
  :init
  (setq projectile-mode-line "Projectile")
  (projectile-mode t)
  (defun jj/show-projects ()
    "List projectile known projects in a *project* buffer."
    (interactive)
    (switch-to-buffer "*projects*")
    (org-mode)
    (insert "#+TITLE: Projects\n\n")
    (dolist (project (projectile-relevant-known-projects))
      (insert (concat "* "  "[" "[file:" project "]" "["(file-name-nondirectory (directory-file-name project)) "]" "]" "\n")))
    (goto-char (point-min))))

;;; flx-ido
(use-package flx-ido
  :commands flx-ido-mode
  :after ido
  :ensure t
  :init
  (flx-ido-mode t))

;;; swiper
(use-package swiper
  :ensure t
  :diminish ivy-mode
  :functions jj/swiper-recenter
  :bind (("C-s" . swiper)
         ("C-r" . swiper))
  :init
  ;;advise swiper to recenter on exit
  (defun jj/swiper-recenter ()
    "recenter display after swiper"
    (recenter))
  (advice-add 'swiper :after #'jj/swiper-recenter))

(use-package dired
  :commands dired
  :init
  (setq dired-listing-switches "-lahv")
  (setq dired-use-ls-dired nil))

;;; load dired extras
(use-package dired-x
  :commands dired-jump
  :bind (("C-x C-j" . dired-jump)))

;;; Doc-view
(use-package doc-view
  :commands doc-view)

;;; Markdown
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init
  (setq markdown-command "multimarkdown"
        markdown-fontify-code-blocks-natively t
        markdown-enable-math t
        markdown-header-scaling t
        markdown-hide-urls t
        markdown-marginalize-headers t
        markdown-marginalize-headers-margin-width 4
        markdown-fontify-code-blocks-natively t)
  (add-hook 'markdown-mode-hook #'flyspell-mode))

(use-package edit-indirect
  :ensure t
  :defer)

;;; yaml-mode
(use-package yaml-mode
  :ensure t
  :commands yaml-mode)

;;; Web-mode
(use-package web-mode
  :ensure t
  :commands web-mode
  :mode (("\\.html$" . web-mode)
         ("\\.xhtml$" . web-mode))
  :init
  (add-hook 'web-mode-hook (lambda () (setq web-mode-markup-indent-offset 2))))

;;; Expand-region
(use-package expand-region
  :ensure t
  :defer t
  :bind ("s-/" . er/expand-region))

;;; whole-line-or-region
(use-package whole-line-or-region
  :ensure t
  :bind (("C-y" . whole-line-or-region-yank)
         ("M-w" . whole-line-or-region-kill-ring-save))
  :diminish whole-line-or-region-local-mode
  :init
  (whole-line-or-region-global-mode t))

;;; white space mode
(use-package whitespace
  :init
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  :init
  (setq whitespace-line-column 80)
  (setq whitespace-style '(trailing lines space-before-tab indentation space-after-tab)))

;;; Kill ring
(use-package browse-kill-ring
  :ensure t
  :bind ("C-c k" . browse-kill-ring))

;;; Abbrev
(use-package abbrev
  :defer t
  :commands abbrev-mode
  :diminish abbrev-mode
  :functions (jj/create-file quietly-read-abbrev-file)
  :init
  (setq abbrev-file-name (concat user-emacs-directory "abbrevs"))
  (setq save-abbrevs 'silently)
  (setq-default abbrev-mode t)
  (setq save-abbrevs t)
  :config
  (unless (file-exists-p abbrev-file-name)
    (jj/create-file abbrev-file-name))
  (quietly-read-abbrev-file))

;;; needed packages
(use-package jka-compr
  :defer t
  :init
  (auto-compression-mode 1))

;;; Save place
(require 'saveplace)
(save-place-mode 1)
(setq save-place-version-control t)
(setq save-place-file (concat user-emacs-directory ".places"))

;;; winner mode
(use-package winner
  :bind (("C-c <left>" . winner-undo)
         ("C-c <right>" . winner-redo))
  :init
  (winner-mode 1))

;;; windmove
(use-package windmove
  :bind (("s-h" . windmove-left)
         ("s-l" . windmove-right)
         ("s-k" . windmove-up)
         ("s-j" . windmove-down))
  :init
  (setq windmove-wrap-around t)
  (windmove-default-keybindings 'super))

;;; Paste at point NOT at cursor
(use-package mwheel
  :init
  (setq mouse-yank-at-point 't))

;;; flycheck
(use-package flycheck
  :ensure t
  :commands flycheck-mode
  :diminish flycheck-mode
  :functions flycheck-display-error-messages-unless-error-list
  :init
  ;; Override default flycheck triggers
  (setq flycheck-check-syntax-automatically '(save idle-change mode-enabled)
        flycheck-idle-change-delay 0.3)
  (setq flycheck-highlighting-mode 'lines)
  (setq flycheck-display-errors-function 'flycheck-display-error-messages-unless-error-list)
  :config
  (setq flycheck-checkers (--remove (eq it 'emacs-lisp-checkdoc) flycheck-checkers)))

;;; backup
;; Save all my backup files in a specific directory
(defconst use-backup-dir t)
(setq backup-directory-alist (quote ((".*" . "~/.emacs.d/backup")))
      version-control t        ;; use version number for backups
      kept-new-versions 6      ;; number of newest version to keep
      kept-old-versions 2      ;; number of oldest version to keep
      delete-old-versions t    ;; ask to delete excess backup versions
      backup-by-copying-when-linked t) ;;copy linked files, don't rename.
(setq auto-save-default t)

;;; revert all buffer when file is modified in disk
;; (use-package autorevert
;;   :init
;;   (setq global-auto-revert-mode nil)
;;   (setq global-auto-revert-non-file-buffers nil)
;;   (setq auto-revert-verbose t))

(require 'desktop nil t)
;; only use desktop mode and timers on server
(when (and (>= emacs-major-version 23) (daemonp))
  ;; use desktop save mode. state is king!
  (setq desktop-dirname (concat user-emacs-directory ".desktop"))
  (unless (file-directory-p desktop-dirname)
    (mkdir desktop-dirname))
  (setq desktop-save t
        desktop-restore-eager 0
        desktop-lazy-idle-delay 0
        desktop-lazy-verbose nil
        desktop-save-buffer t                   ; "auxiliary buffer status
        desktop-load-locked-desktop t
        desktop-save-mode 1)
  ;; save history and desktop periodically, since emacs is often killed,
  ;; and not quite nicely.
  (defun jj/save-desktop()
    (desktop-save-in-desktop-dir)
    ;; clear the "Desktop saved in..." message
    (message nil))
  (run-with-idle-timer 60 t 'jj/save-desktop))

;;; spelling
(use-package ispell
  :commands ispell
  :init
  (setq ispell-program-name "aspell"))

(use-package flyspell
  :diminish flyspell-mode
  :commands flyspell-mode
  :after ispell
  :init
  ;; automatically check spelling for text
  (add-hook 'text-mode-hook 'flyspell-mode)
  ;; spell check comments and strings when programming
  (add-hook 'prog-mode-hook 'flyspell-prog-mode)
  ;; spell check git commit messages
  (add-hook 'git-commit-mode-hook 'flyspell-mode))

;;; Info
;;Add the init-path tree to the Info path
(use-package info
  :commands info
  :init (info-initialize))

(provide 'global)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; global.el ends here
