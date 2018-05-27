;;; eshell-conf.el --- Emacs shell configuration.
;;
;; Filename: eshell-conf.el
;; Description:
;; Author: Juan Fuentes
;; Maintainer:
;; Created: Tue May 24 23:35:38 2011 (-0400)
;; Version:
;; Package-Requires: ()
;; Last-Updated: Sat Nov 23 12:57:11 2013 (-0400)
;;           By:
;;     Update #: 13
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

(use-package eshell
  :commands (eshell jj/esh)
  :init
  (add-hook 'eshell-mode-hook 'jj/eshell-mode-hook)
  ;; (add-to-list 'eshell-output-filter-functions 'eshell-handle-ansi-color)
  :config
  (setq pcomplete-cycle-completions t)

  (use-package em-ls
    :after eshell
    :init
    (setq eshell-ls-use-colors nil))

  (use-package em-smart
    :after eshell
    :init
    (setq eshell-where-to-jump 'begin
	  eshell-review-quick-commands nil
	  eshell-smart-space-goes-to-end t))

  (use-package em-hist
    :after eshell
    :init
    (setq eshell-history-size 500
	  eshell-save-history-on-exit t))

  (defun jj/eshell-mode-hook()
    (define-key eshell-mode-map "\C-a" 'eshell-bol)
    (define-key eshell-mode-map "\t" 'pcomplete-list)
    (define-key eshell-mode-map (kbd "<up>") 'previous-line)
    (define-key eshell-mode-map (kbd "<down>") 'next-line))

  (setenv "PAGER" "cat")
  (unless (string= (getenv "PROMPT_COMMAND") "")
    (setenv "PROMPT_COMMAND" ""))

  (use-package em-term
    :after eshell
    :custom
    (eshell-destroy-buffer-when-process-dies t)
    :config
    (add-to-list 'eshell-visual-commands '("ssh" "tail" "top" "htop"))
    (add-to-list 'eshell-visual-options '("git" "--help"))
    (add-to-list 'eshell-visual-subcommands '("git" "log" "diff" "show")))

  (use-package em-cmpl
    :after eshell
    :config
    (add-to-list 'eshell-command-completions-alist '("gunzip" "gz\\'"))
    (add-to-list 'eshell-command-completions-alist '("tar" "\\(\\.tar|\\.tgz\\|\\.tar\\.gz\\)\\'"))
    (setq eshell-cmpl-cycle-completions t)
    (setq eshell-cmpl-dir-ignore "\\`\\(\\.\\.?\\|CVS\\|\\.svn\\|\\.hg\\|\\.git\\)/\\'"))

  (use-package em-prompt
    :after em-dirs
    :config
    (setq eshell-prompt-regexp "^[^#%\n]*[#%] ")
    (setq eshell-prompt-function  'jj/eshell-prompt))

  (use-package em-dirs
    :after eshell
    :functions eshell/pwd
    :functions eshell/cd
    :config
    (defun jj/eshell-prompt()
      (concat (abbreviate-file-name (eshell/pwd))
	      (if (= (user-uid) 0)
		  "# " "% ")))

    (defun jj/simple-eshell-prompt ()
      (if (= (user-uid) 0)
	  "# " "% "))))

(provide 'eshell-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; eshell-conf.el ends here
