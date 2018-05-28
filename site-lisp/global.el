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
;; (blink-cursor-mode -1)

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

;; sensible zap to char
(autoload 'zap-up-to-char "misc" "Kill up to, but not including ARGth occurrence of CHAR.")

;; Don't allow the scratch buffer to be killed. It will delete it's contents instead.
(add-hook 'kill-buffer-query-functions 'jj/immortal-scratch-buffer)

;; backtracks search to beginning of buffer.
(add-hook 'isearch-mode-end-hook 'jj/goto-match-beginning)

;;; sessions
(defvar session-save-file (concat user-emacs-directory ".session"))

;;; tramp
(defvar tramp-default-method "ssh")
(defvar tramp-ssh-controlmaster-options nil)

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
