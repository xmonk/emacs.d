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

(require 'eshell nil t)
(require 'em-smart nil t)

(setq eshell-where-to-jump 'begin
      eshell-ls-use-colors nil
      eshell-review-quick-commands nil
      eshell-smart-space-goes-to-end t
      eshell-history-size 500
      eshell-save-history-on-exit t
      eshell-cmpl-cycle-completions t
      pcomplete-cycle-completions t
      eshell-cmpl-dir-ignore "\\`\\(\\.\\.?\\|CVS\\|\\.svn\\|\\.hg\\|\\.git\\)/\\'")

(defun jj/eshell-mode-hook()
  (define-key eshell-mode-map "\C-a" 'eshell-bol)
  (define-key eshell-mode-map "\t" 'pcomplete-list)
  (define-key eshell-mode-map (kbd "<up>") 'previous-line)
  (define-key eshell-mode-map (kbd "<down>") 'next-line))

(defun jj/eshell-prompt()
  (concat (abbreviate-file-name (eshell/pwd))
          (if (= (user-uid) 0)
              "# " "$ ")))

(defun jj/simple-eshell-prompt ()
  (if (= (user-uid) 0)
      "# " "$ "))

(load-after esh-opt
  (require 'em-prompt)
  (require 'em-term)
  (require 'em-cmpl)

  ;; TODO: for some reason requiring this here breaks it, but
  ;; requiring it after an eshell session is started works fine.
  ;; (require 'eshell-vc)
  (setenv "PAGER" "cat")
  (unless (string= (getenv "PROMPT_COMMAND") "")
    (setenv "PROMPT_COMMAND" ""))
  ;; (set-face-attribute 'eshell-prompt nil :foreground "grey73")
  (add-hook 'eshell-mode-hook 'jj/eshell-mode-hook)

  (add-to-list 'eshell-visual-commands "ssh")
  (add-to-list 'eshell-visual-commands "tail")
  (add-to-list 'eshell-command-completions-alist
               '("gunzip" "gz\\'"))
  (add-to-list 'eshell-command-completions-alist
               '("tar" "\\(\\.tar|\\.tgz\\|\\.tar\\.gz\\)\\'"))
  (add-to-list 'eshell-output-filter-functions 'eshell-handle-ansi-color))

(defun eshell/cds ()
  "Change directory to the project's root."
  (eshell/cd (locate-dominating-file default-directory "src")))

(setq eshell-prompt-regexp "^[^#$\n]*[#$] ")

;;(let ((path (split-string (getenv "PATH") ":")))
;;  (add-to-list 'path (concat (getenv "HOME") "/bin"))
;;  (setenv "PATH" (mapconcat 'identity path ":")))

(setq eshell-prompt-function  'jj/eshell-prompt)

(provide 'eshell-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; eshell-conf.el ends here
