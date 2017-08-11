;;; global.el ---  Global emacs configuration.
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
;; (blink-cursor-mode -1)

;; don't scroll like a maniac
(defvar mouse-wheel-scroll-amount '(1))
(defvar mouse-wheel-progressive-speed nil)

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
(setq-default indent-tabs-mode t)
(setq-default tab-width '8)
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
;; setup the mode-line as I like it.
;; (setq-default mode-line-format
;;               (list (purecopy "")
;;                     'mode-line-modified
;;                     'mode-line-buffer-identification
;;                     (purecopy ":%l   ")
;;                     'global-mode-string
;;                     'vc-mode
;;                     (purecopy "   %[(")
;;                     'mode-name 'minor-mode-alist (purecopy "%n") 'mode-line-process
;;                     (purecopy ")%]----%p-%-")))

;; seed the random-number generator
(random t)

;; make ibuffer the default
(defalias 'list-buffers 'ibuffer)

;; set-goal-column
(put 'set-goal-column 'disabled nil)

;; enable narrow-to-page, narrow-to-region
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; enable dired-find-alternate-file
(put 'dired-find-alternate-file 'disabled nil)

;; Don't ask for confirmation of new buffers.
(setq confirm-nonexistent-file-or-buffer nil)

;;; sensible zap to char
(autoload 'zap-up-to-char "misc" "Kill up to, but not including ARGth occurrence of CHAR.")

;;; tramp
(defvar tramp-default-method "ssh")
(defvar tramp-ssh-controlmaster-options "")

;;; company
(use-package company
  :defer 10
  :ensure t
  :bind (("C-c TAB" . company-complete))
  :diminish company-mode
  :defer t
  :init (global-company-mode 1)
  :config
  (use-package company-flx
    :ensure t
    :init
    (add-hook 'company-mode-hook (lambda ()
				   (add-to-list 'company-backends 'company-capf)))
    (company-flx-mode +1))

  (setq company-tooltip-limit 20
        company-quickhelp-idle-delay 4
        company-minimum-prefix-length 3
        company-idle-delay .3
        company-echo-delay 0
	;;company-transformers '(company-sort-by-backend-importance)
	company-auto-complete nil
	company-begin-commands nil))

;;; on duplicate filenames, show path names.
(use-package uniquify
  :defer 5
  :init
  (setq uniquify-buffer-name-style 'post-forward
	uniquify-separator ":"
	uniquify-after-kill-buffer-p t))

;;; recentf
(use-package recentf
  :bind (("C-c C-r" . jj/recentf-ido-find-file))
  :init
  (recentf-mode t))

;;; no-littering keeps .emacs.d clean.
(use-package no-littering
  :ensure t
  :config
  (require 'recentf)
  (add-to-list 'recentf-exclude no-littering-var-directory)
  (add-to-list 'recentf-exclude no-littering-etc-directory))

;;; paredit
(use-package paredit
  :ensure t
  :defer t
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
  :defer t
  :init (cscope-setup)
  :config
  (setq cscope-program "cscope"))

;;; diminish
(use-package diminish
  :ensure t)

(use-package eldoc
  :defer t
  :commands eldoc-mode
  :diminish eldoc-mode)

(use-package git-timemachine
  :defer t
  :commands git-timemachine
  :ensure t)

;;; undo-tree
(use-package undo-tree
  :ensure t
  :defer 5
  :diminish undo-tree-mode
  :bind (("C-x u" . undo-tree-undo)
         ("s-z" . undo-tree-undo)
         ("s-r" . undo-tree-redo))
  :config
  (undo-tree-mode t)
  (global-undo-tree-mode t)
  (setq undo-tree-visualizer-relative-timestamps t)
  (setq undo-tree-visualizer-timestamps t))

;;; projectile
(use-package projectile
  :ensure t
  :defer 5
  :diminish projectile-mode
  :init (setq projectile-mode-line "Projectile")
  :bind (("C-c p p" . projectile-switch-project))
  :config
  (projectile-mode t))

;;; swiper
(use-package swiper
  :ensure t
  :diminish ivy-mode
  :bind (("C-s" . swiper)
	 ("C-r" . swiper)
	 ("C-c v" . ivy-push-view)
         ("C-c V" . ivy-pop-view))
  :config
  ;; (ivy-mode 1)
  ;; (setq ivy-use-virtual-buffers t)
  ;; (setq ivy-count-format "%d/%d ")
  ;;advise swiper to recenter on exit
  (defun jj/swiper-recenter (&rest args)
    "recenter display after swiper"
    (recenter))
  (advice-add 'swiper :after #'jj/swiper-recenter))

(use-package dired
  :defer 10
  :commands dired
  :init
  (setq dired-listing-switches "-lahv")
  (setq dired-use-ls-dired nil))

;;; load dired extras
(use-package dired-x
  :defer 10
  :commands dired-jump)

;;; Don't allow the scratch buffer to be killed. It will delete it's contents instead.
(add-hook 'kill-buffer-query-functions 'jj/immortal-scratch-buffer)

;;; Byte-compile on exit
(add-hook 'kill-emacs-query-functions 'jj/refresh-init-elc)

;;; Doc-view
(use-package doc-view
  :commands doc-view)

;;; Markdown
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("\\.\\(m\\(ark\\)?down\\|md\\)$" . markdown-mode)
	 ("README\\.md\\'" . gfm-mode))
  :init
  (add-hook 'markdown-mode-hook 'flyspell-mode)
  :config
  (setq markdown-fontify-code-blocks-natively t)
  (add-to-list 'markdown-code-lang-modes '("python" . python-mode))
  (let ((markdown-cmd "peg-markdown"))
    (when (executable-find markdown-cmd)
      (setq markdown-command markdown-cmd))))

;;; Web-mode
(use-package web-mode
  :ensure t
  :defer t
  :mode (("\\.html$" . web-mode)
	 ("\\.xhtml$" . web-mode))
  :init
  (add-hook 'web-mode-hook (lambda ()
			     (setq web-mode-markup-indent-offset 2))))

;;; Expand-region
(use-package expand-region
  :ensure t
  :defer t
  :bind ("s-/" . er/expand-region))

;;; vc
(setq vc-follow-symlinks t)

;;; codesearch http://code.google.com/p/codesearch/
(use-package codesearch
  :ensure t
  :commands (codesearch-search codesearch-reset codesearch-list-directories)
  :init
  (jj/codesearcher codesearch-goodbed "~/.goodbedindex")
  (jj/codesearcher codesearch-colmapp "~/.tns.csindex"))

;;; Smart scan
(use-package smartscan
  :disabled
  :defer t
  :commands smartscan-mode
  :bind-keymap (("S-n" . smartscan-map)
		("S-p" . smartscan-map)
		("S-'" . smartscan-map))
  :init
  (global-smartscan-mode 1)
  (unbind-key "M-n" smartscan-map)
  (unbind-key "M-p" smartscan-map)
  (unbind-key "M-'" smartscan-map))

;;; Whitespace-mode
(setq whitespace-line-column 80
      whitespace-style '(trailing lines space-before-tab
                                  indentation space-after-tab))
;;; Remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;; whole-line-or-region-mode
(use-package whole-line-or-region
  :ensure t
  :defer t
  :bind (("C-y" . whole-line-or-region-yank)
	 ("M-w" . whole-line-or-region-kill-ring-save))
  :diminish whole-line-or-region-mode
  :init
  (whole-line-or-region-mode))

;;; Kill ring
(use-package browse-kill-ring
  :ensure t
  :bind ("C-c k" . browse-kill-ring))

;; add system clipboard to kill-ring
(setq save-interprogram-paste-before-kill t)

;;; Abbrev
(use-package abbrev
  :defer t
  :commands abbrev-mode
  :diminish abbrev-mode
  :config
  (setq abbrev-file-name (concat user-emacs-directory "abbrevs"))
  (unless (file-exists-p abbrev-file-name)
    (jj/create-file abbrev-file-name))
  (quietly-read-abbrev-file)
  (setq save-abbrevs 'silently)
  (setq-default abbrev-mode t)
  (setq save-abbrevs t))

;;; needed packages
(use-package jka-compr
  :defer t
  :config
  (auto-compression-mode 1))

;;; Save place
(save-place-mode 1)
(setq save-place-version-control t)
(setq save-place-file (concat user-emacs-directory ".places"))

;;; winner mode
(use-package winner
  :bind (("C-c <left>" . winner-undo)
	 ("C-c <right>" . winner-redo))
  :init
  (winner-mode))

;;; windmove
(use-package windmove
  :bind (("s-h" . windmove-left)
	 ("s-l" . windmove-right)
	 ("s-k" . windmove-up)
	 ("s-j" . windmove-down))
  :config
  (windmove-default-keybindings 'super)
  (setq windmove-wrap-around t))

;;; sessions
(setq session-save-file (concat user-emacs-directory ".session"))

;;; Paste at point NOT at cursor
(use-package mwheel
  :defer t
  :init
  (setq mouse-yank-at-point 't))

;;; Mouse copy region
(setq mouse-drag-copy-region t)

;;; flycheck
(use-package flycheck
  :ensure t
  :commands flycheck-mode
  :diminish flycheck-mode
  :config
  ;; Override default flycheck triggers
  (setq flycheck-check-syntax-automatically '(save idle-change mode-enabled)
        flycheck-idle-change-delay 0.3)
  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list))

;;; backup
;; Save all my backup files in a specific directory
(defconst use-backup-dir t)
(setq backup-directory-alist (quote ((".*" . "~/.emacs.d/.backup")))
      version-control t        ;; use version number for backups
      kept-new-versions 6      ;; number of newest version to keep
      kept-old-versions 2      ;; number of oldest version to keep
      delete-old-versions t    ;; ask to delete excess backup versions
      backup-by-copying-when-linked t) ;;copy linked files, don't rename.
(setq auto-save-default t)

;;; revert all buffer when file is modified in disk
(setq global-auto-revert-mode t)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; backtracks search to beginning of buffer.
(add-hook 'isearch-mode-end-hook 'jj/goto-match-beginning)

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
        desktop-save-buffer t          ; "auxiliary buffer status
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
  :config
  (setq ispell-program-name "aspell")
  (setq ispell-exta-args '("--sug-mode=ultra"))
  (use-package flyspell
    :diminish flyspell-mode
    :commands flyspell-mode
    :init
    ;; automatically check spelling for text
    (add-hook 'text-mode-hook 'flyspell-mode)
    ;; spell check comments and strings when programming
    (add-hook 'prog-mode-hook 'flyspell-prog-mode)
    ;; spell check git commit messages
    (add-hook 'git-commit-mode-hook 'flyspell-mode)))

;;; Info
;;Add the init-path tree to the Info path
(use-package info
  :commands info
  :init
  (info-initialize)
  (setq initial-info-path Info-directory-list)
  (setq Info-directory-list (append (getenv "INFOPATH") initial-info-path)))

;;; Ediff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq diff-switches "-Nu")

;;;Mail related stuff.
(setq mail-user-agent (quote gnus-user-agent))
(setq read-mail-command (quote gnus))
(setq mail-yank-prefix ">")

;; If images are supported than display them when visiting them.
(when (fboundp 'auto-image-file-mode)
    (auto-image-file-mode 1))

(add-hook 'prog-mode-hook 'jj/pretty-lambdas)
(add-hook 'prog-mode-hook 'jj/local-comment-auto-fill)
(add-hook 'prog-mode-hook 'jj/add-watchwords)

(provide 'global)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; global.el ends here
