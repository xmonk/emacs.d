;;; py-conf.el --- Python configuration
;;
;; Filename: py-conf.el
;; Description:
;; Author: Juan Fuentes
;; Maintainer:
;; Created: Thu Apr 28 19:54:14 2011 (-0400)
;; Version:
;; Package-Requires: (jedi, epc, company-mode, flycheck)
;; Last-Updated: Sat Apr 18 14:11:46 2015 (-0400)
;;           By:
;;     Update #: 114
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

(use-package python
  :commands python-mode
  :custom
  (flycheck-flake8rc (concat (getenv "HOME") "/" ".config" "/" "flake8"))
  (flycheck-python-flake8-executable (executable-find "flake8"))
  :init
  (add-hook 'python-mode-hook 'jj/py-hook)
  (add-hook 'python-mode-hook 'flycheck-mode)
  (add-hook 'python-mode-hook 'cscope-minor-mode)
  (add-hook 'python-mode-hook 'ycmd-mode)
  (defun jj/py-hook ()
    (setq-local tab-width '4)
    (setq-local indent-tabs-mode nil)
    (autoload 'doctest-mode "doctest-mode" "Python doctest editing mode." t)
    (subword-mode +1))
  (defun jj/restart-python ()
    (set-variable 'ycmd-server-command `(,(executable-find "python3") ,(file-truename "~/.emacs.d/ycmd/ycmd/")))
    (pyvenv-restart-python)
    (ycmd-restart-semantic-server))

  (cond ((executable-find "ipython")
         (setq python-shell-interpreter "ipython")
         (setq python-shell-interpreter-args "--simple-prompt"))
        ((executable-find "python3")
         (setq python-shell-interpreter "python3"
               python-shell-interpreter-args "-i"
               comint-process-echoes t
               python-shell-completion-native-enable t)))
  ;; Don't font lock in an inferior python shell. It's too easy for a
  ;; docstring (when using foo? in ipython) to contain doublequotes and
  ;; all the highlighting is broken from then onwards.
  (setq python-shell-font-lock-enable nil)
  :config
  (use-package blacken
    :after python
    :when (executable-find "black")
    :hook (python-mode . blacken-mode)
    :bind (("C-M-\\" . blacken-buffer))
    :ensure t)

  (use-package auto-virtualenv
    :ensure t
    :init
    (add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv)
    (add-hook 'projectile-after-switch-project-hook 'auto-virtualenv-set-virtualenv)
    (add-hook 'pyvenv-post-activate-hooks 'jj/restart-python))

  (use-package pipenv
    :disabled
    :ensure t
    :hook (python-mode . pipenv-mode)
    :init
    (setq pipenv-projectile-after-switch-function #'pipenv-projectile-after-switch-extended))

  (defun jj/pydoc (name)
    "Display pydoc information for NAME in a buffer named *pydoc*."
    (interactive "sName of function or module: ")
    (switch-to-buffer-other-window "*pydoc*")
    (erase-buffer)
    (insert (shell-command-to-string (format "python -m pydoc %s" name)))
    (goto-char (point-min)))

  (defun python--add-debug-highlight()
    "Adds a highlighter for use by `python--pdb-breakpoint-string'"
    (highlight-lines-matching-regexp "## DEBUG ##\\s-*$" 'hi-red-b))

  (add-hook 'python-mode-hook 'python--add-debug-highlight)

  (defvar python--ipdb-breakpoint-string "import ipdb; ipdb.set_trace() ## DEBUG ##"
    "Python breakpoint string used by `python-insert-breakpoint'")

  (defun python-insert-breakpoint()
    "Inserts a python breakpoint using `ipdb'"
    (interactive)
    (back-to-indentation)
    ;; this preserves the correct indentation in case the line above
    ;; point is a nested block
    (split-line)
    (insert python--ipdb-breakpoint-string))

  (bind-key (kbd "<f5>") 'python-insert-breakpoint python-mode-map))

(provide 'py-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; py-conf.el ends here
