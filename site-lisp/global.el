(provide 'global)

;; frame setup
(set-face-attribute 'default nil :font "Lucida Grande Mono" :height 120 :slant 'normal :weight 'normal)
(set-face-attribute 'mode-line nil :font "Lucida Grande" :height 120 :slant 'normal :weight 'normal)
(set-face-attribute 'font-lock-comment-face nil :slant 'italic :weight 'normal)
;; stop cursor from blinking
(blink-cursor-mode -1)
;; don't scroll like a maniac
(setq mouse-wheel-scroll-amount '(1))
(setq mouse-wheel-progressive-speed nil)
;; disable scroll-bar and tool-bar
(dolist (mode '(scroll-bar-mode tool-bar-mode))
  (if (fboundp mode) (funcall mode -1)))

(when running-apple
  (if (boundp 'mac-option-modifier)
      (setq mac-option-modifier 'meta))
  (setq mac-allow-anti-aliasing t))

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

;; load Ubuntu's site-lisp if exists.
(if (file-directory-p "/usr/share/emacs/site-lisp")
    (setq load-path (cons "/usr/share/emacs/site-lisp" load-path)))

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
(set-default 'indicate-empty-lines nil)
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

;; set-goal-column
(put 'set-goal-column 'disabled nil)

;; enable narrow-to-page, narrow-to-region
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; enable dired-find-alternate-file
(put 'dired-find-alternate-file 'disabled nil)

;; Don't ask for confirmation of new buffers.
(setq confirm-nonexistent-file-or-buffer nil)

;; sensible zap to char
(autoload 'zap-up-to-char "misc" "Kill up to, but not including ARGth occurrence of CHAR.")

;; ido
(require 'ido nil t)
(load-after ido
  (ido-mode 1)
  (ido-everywhere))

;; on duplicate filenames, show path names.
(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'post-forward
        uniquify-separator ":"
        uniquify-after-kill-buffer-p t))

;; diminish
(use-package diminish
  :ensure t
  :config
  (load-after eldoc (diminish 'eldoc-mode)))

(use-package git-timemachine
  :commands git-timemachine
  :ensure t)

;; undo-tree
(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :bind (("s-z" . undo-tree-undo)
         ("s-r" . undo-tree-redo))
  :config
  (undo-tree-mode t)
  (global-undo-tree-mode t)
  (setq undo-tree-visualizer-relative-timestamps t)
  (setq undo-tree-visualizer-timestamps t))

;; load dired extras
(use-package dired-x
  :config (setq dired-use-ls-dired nil))

;; don't allow the scratch buffer to be killed. It will delete it's
;; contents instead.
(add-hook 'kill-buffer-query-functions 'jj/immortal-scratch-buffer)

;; byte-compile on exit
(add-hook 'kill-emacs-query-functions 'jj/refresh-init-elc)

;; doc-view
(autoload 'doc-view "doc-view" nil t)

;; markdown
(use-package markdown-mode
  :commands markdown-mode
  :ensure t)

;; expand-region
(use-package expand-region
  :ensure t
  :bind ("s-/" . er/expand-region))

;; vc
(setq vc-follow-symlinks t)

(setq change-log-default-name "ChangeLog"
      user-full-name "Juan Fuentes"
      user-mail-address "juan.j.fuentes@gmail.com"
      vc-svn-header '("\$Id\$"))
;; codesearch http://code.google.com/p/codesearch/
(use-package codesearch
  :commands (codesearch-search codesearch-reset codesearch-list-directories)
  :ensure t)

;; etags
(autoload 'etags-table "etags-table")
(load-after etags-table
  (setq etags-table-search-up-depth 10))

;; Remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; whitespace-mode
(setq whitespace-line-column 80
      whitespace-style '(trailing lines space-before-tab
                                  indentation space-after-tab))

;; whole-line-or-region-mode
(use-package whole-line-or-region
  :defer 2
  :ensure t
  :diminish whole-line-or-region-mode
  :config
  (whole-line-or-region-mode))
;; Kill ring
(use-package browse-kill-ring
  :ensure t
  :bind ("C-c k" . browse-kill-ring))

;;abbrev
(use-package abbrev
  :commands abbrev-mode
  :diminish abbrev-mode
  :config
  (setq abbrev-file-name (concat user-emacs-directory "abbrevs"))
  (if (file-exists-p abbrev-file-name)
      (quietly-read-abbrev-file))
  (setq-default abbrev-mode t)
  (setq save-abbrevs t))

;; needed packages
(autoload 'jka-compr "jka-compr" nil t)
(auto-compression-mode 1)

;; Save place
(require 'saveplace nil t)
(setq-default save-place t)
(setq save-place-file (concat user-emacs-directory ".places"))
(setq save-place-limit 100)

;; winner mode
(use-package winner
  :defer 2
  :config
  (winner-mode))
;; sessions
(setq session-save-file (concat user-emacs-directory ".session"))

;; Paste at point NOT at cursor
(autoload 'mwheel "mwheel" nil t)
(setq mouse-yank-at-point 't)

(cond ((eq window-system 'x)
       (setq browse-url-browser-function 'browse-url-default-browser))
      ((eq window-system 'ns)
       (setq browse-url-browser-function 'browse-url-default-macosx-browser))
      ((eq window-system 'nil)
       (setq browse-url-browser-function 'eww-browse-url)))

;; flycheck
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

;; Save all my backup files in a specific directory
(defconst use-backup-dir t)
(setq backup-directory-alist (quote ((".*" . "~/.emacs.d/.backup")))
      version-control t        ;; use version number for backups
      kept-new-versions 6      ;; number of newest version to keep
      kept-old-versions 2      ;; number of oldest version to keep
      delete-old-versions t    ;; ask to delete excess backup versions
      backup-by-copying-when-linked t) ;;copy linked files, don't rename.
(setq auto-save-default nil)

;; revert all buffer when file is modified in disk
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

;; Start Server only if it's not
(require 'server nil t)
(when (and (>= emacs-major-version 23) (not (server-running-p)))
  (server-start))

(when (server-running-p)
  (when (eq window-system nil)
    (menu-bar-mode -1)))

;; spelling
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

;; Add the init-path tree to the Info path
(require 'info nil t)
(info-initialize)
(setq initial-info-path Info-directory-list)
(setq Info-directory-list (append (getenv "INFOPATH") initial-info-path))

;; Ediff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq diff-switches "-Nu")

;;Mail related stuff.
(setq mail-user-agent (quote gnus-user-agent))
(setq read-mail-command (quote gnus))
(setq mail-yank-prefix ">")

;; If images are supported than display them when visiting them.
(if (fboundp 'auto-image-file-mode)
    (auto-image-file-mode 1))

(when (font-lock-mode)
  (add-hook 'prog-mode-hook 'jj/pretty-lambdas))
(add-hook 'prog-mode-hook 'jj/local-comment-auto-fill)
(add-hook 'prog-mode-hook 'jj/add-watchwords)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; global.el ends here
