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
(blink-cursor-mode -1)

;; don't scroll like a maniac
(setq mouse-wheel-scroll-amount '(1))
(setq mouse-wheel-progressive-speed nil)

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

;;; load Ubuntu's site-lisp if exists.
(if (file-directory-p "/usr/share/emacs/site-lisp")
    (setq load-path (cons "/usr/share/emacs/site-lisp" load-path)))

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
(setq minibuffer-max-depth nil)
(setq show-paren-delay 0)
(setq show-paren-highlight-openparen nil)
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

;; setup the mode-line as I like it.
(setq-default mode-line-format
              (list (purecopy "")
                    'mode-line-modified
                    'mode-line-buffer-identification
                    (purecopy ":%l   ")
                    'global-mode-string
                    'vc-mode
                    (purecopy "   %[(")
                    'mode-name 'minor-mode-alist (purecopy "%n") 'mode-line-process
                    (purecopy ")%]----%p-%-")))

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
(setq tramp-default-method "ssh")

;;; company
(use-package company
  :ensure t
  :bind (("C-c TAB" . company-complete))
  :diminish company-mode
  :config
  (global-company-mode 1)
  (setq company-tooltip-limit 20
        company-quickhelp-idle-delay 4
        company-minimum-prefix-length 3
        company-idle-delay .3
        company-echo-delay 0
        company-begin-commands '(self-insert-command)
        company-auto-complete nil
        company-begin-commands nil))

;;; ido
(use-package ido
  :commands ido-mode
  :init
  (add-hook 'ido-setup-hook
   (lambda()
     ;; Go straight home
     (define-key ido-file-completion-map (kbd "~")
       (lambda()
	 (interactive)
	 (if (looking-back "/")
	     (insert "~/")
	   (call-interactively 'self-insert-command))))))
  (ido-mode 1)
  (ido-everywhere))

;;; smex
(use-package smex
  :disabled
  :ensure nil
  :bind (("C-x C-m" . smex)
	 ("C-x m" . smex-major-mode-commands))
  :config
  (setq smex-auto-update nil))

;;; on duplicate filenames, show path names.
(use-package uniquify
  :init
  (setq uniquify-buffer-name-style 'post-forward
	uniquify-separator ":"
	uniquify-after-kill-buffer-p t))

;;; paredit
(use-package paredit
  :ensure t
  :commands paredit-mode
  :diminish paredit-mode
  :config
  (use-package paredit-ext)
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


;;; diminish
(use-package diminish
  :ensure t
  :config
  (load-after eldoc (diminish 'eldoc-mode)))

(use-package git-timemachine
  :commands git-timemachine
  :ensure t)

;;; undo-tree
(use-package undo-tree
  :ensure t
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
  :diminish projectile-mode
  :init (setq projectile-mode-line "Projectile")
  :config
  (projectile-global-mode))

(use-package dired
  :commands dired
  :init
  (setq dired-listing-switches "-lahv")
  (setq dired-use-ls-dired nil))

;;; load dired extras
(use-package dired-x
  :commands dired-jump)

;;; Don't allow the scratch buffer to be killed. It will delete it's contents instead.
(add-hook 'kill-buffer-query-functions 'jj/immortal-scratch-buffer)

;;; Byte-compile on exit
(add-hook 'kill-emacs-query-functions 'jj/refresh-init-elc)

;;; Doc-view
(autoload 'doc-view "doc-view" nil t)

;;; Markdown
(use-package markdown-mode
  :ensure t
  :defer t
  :mode ("\\.\\(m\\(ark\\)?down\\|md\\)$" . markdown-mode)
  :init
  (add-hook 'markdown-mode-hook 'flyspell-mode)
  :config
  (let ((markdown-cmd "peg-markdown"))
    (when (executable-find markdown-cmd)
      (setq markdown-command markdown-cmd))))

;;; Expand-region
(use-package expand-region
  :ensure t
  :bind ("s-/" . er/expand-region))

;;; vc
(setq vc-follow-symlinks t)
(setq change-log-default-name "ChangeLog"
      user-full-name "Juan Fuentes"
      user-mail-address "juan.j.fuentes@gmail.com"
      vc-svn-header '("\$Id\$"))

;;; codesearch http://code.google.com/p/codesearch/
(use-package codesearch
  :commands (codesearch-search codesearch-reset codesearch-list-directories)
  :ensure t)

;;; Smart scan
(use-package smartscan
  :ensure t
  :commands smartscan-mode
  :bind-keymap (("M-n" . smartscan-map)
		("M-p" . smartscan-map)
		("M-'" . smartscan-map))
  :config
  (global-smartscan-mode 1))

;;; etags
(autoload 'etags-table "etags-table" nil t)
(load-after etags-table
  (setq etags-table-search-up-depth 10))

;;; Remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;; Whitespace-mode
(setq whitespace-line-column 80
      whitespace-style '(trailing lines space-before-tab
                                  indentation space-after-tab))

;;; whole-line-or-region-mode
(use-package whole-line-or-region
  :defer 2
  :ensure t
  :diminish whole-line-or-region-mode
  :config
  (whole-line-or-region-mode))

;;; Kill ring
(use-package browse-kill-ring
  :ensure t
  :bind ("C-c k" . browse-kill-ring))

;;; Abbrev
(use-package abbrev
  :commands abbrev-mode
  :diminish abbrev-mode
  :config
  (setq abbrev-file-name (concat user-emacs-directory "abbrevs"))
  (if (file-exists-p abbrev-file-name)
      (quietly-read-abbrev-file))
  (setq-default abbrev-mode t)
  (setq save-abbrevs t))

;;; needed packages
(autoload 'jka-compr "jka-compr" nil t)
(load-after jka-compr
  (auto-compression-mode 1))

;;; Save place
(require 'saveplace nil t)
(setq-default save-place t)
(setq save-place-file (concat user-emacs-directory ".places"))
(setq save-place-limit 100)

;;; swiper
(use-package swiper
  :ensure t
  :bind ("C-c C-s" . swiper))

;;; winner mode
(use-package winner
  :defer 2
  :init
  (winner-mode))

;;; sessions
(setq session-save-file (concat user-emacs-directory ".session"))

;;; Paste at point NOT at cursor
;;(autoload 'mwheel "mwheel" nil t)
(use-package mwheel
  :init
  (setq mouse-yank-at-point 't))

;;; browser
(cond ((eq window-system 'x)
       (setq browse-url-browser-function 'browse-url-default-browser))
      ((eq window-system 'ns)
       (setq browse-url-browser-function 'browse-url-default-macosx-browser))
      ((eq window-system 'nil)
       (setq browse-url-browser-function 'eww-browse-url)))

;;; flycheck
(use-package flycheck
  :ensure t
  :defer 5
  :diminish flycheck-mode
  :init
  (add-hook 'after-init-hook #'global-flycheck-mode)
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
(setq auto-save-default nil)

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
    :config
    ;; automatically check spelling for text
    (add-hook 'text-mode-hook 'flyspell-mode)
    ;; spell check comments and strings when programming
    (add-hook 'prog-mode-hook 'flyspell-prog-mode)
    ;; spell check git commit messages
    (add-hook 'git-commit-mode-hook 'flyspell-mode)))

;;; Info
;;Add the init-path tree to the Info path
;;(autoload 'info "info" nil t)
(use-package info ;;load-after info
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
(if (fboundp 'auto-image-file-mode)
    (auto-image-file-mode 1))

(add-hook 'prog-mode-hook 'jj/pretty-lambdas)
(add-hook 'prog-mode-hook 'jj/local-comment-auto-fill)
(add-hook 'prog-mode-hook 'jj/add-watchwords)

;;; Header
(use-package header2
  :ensure t
  :bind ("<f9>" . make-header)
  :config
  (setq make-header-hook '(;;header-mode-line
                           header-title
                           header-blank
                           header-file-name
                           header-description
                           header-author
                           header-maintainer
                           header-copyright
                           header-creation-date
                           header-version
                           header-pkg-requires
                           header-modification-date
                           header-modification-author
                           header-update-count
                           header-url
                           header-doc-url
                           header-keywords
                           header-compatibility
                           header-blank
                           header-lib-requires
                           header-commentary
                           header-blank
                           header-history
                           header-blank
                           header-code
                           header-eof
                           ))
  (autoload 'auto-update-file-header "header2")
  (add-hook 'write-file-hooks 'auto-update-file-header))

;;; eshell
(defun jj/eshell-prompt ()
  "Personal prompt."
  (if (= (user-uid) 0)
      "# " ":; "))
(setq eshell-prompt-regexp "^[^#:;\n]*[#;] ")
(setq eshell-prompt-function  'jj/eshell-prompt)
(setq eshell-ls-use-colors nil)

(provide 'global)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; global.el ends here
