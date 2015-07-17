;;; py-conf.el --- Python configuration
;;
;; Filename: py-conf.el
;; Description:
;; Author: Juan Fuentes
;; Maintainer:
;; Created: Thu Apr 28 19:54:14 2011 (-0400)
;; Version:
;; Package-Requires: (jedi, epc, auto-complete, flycheck)
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

(load-after python
  ;; set path pythonpath and exec-path if *venv* is not set in $PATH and $PYTHONPATH.
  (defvar *venv* (concat (getenv "HOME") "/.venv/"))
  (unless (and (file-directory-p *venv*) (string-match *venv* (getenv "PATH"))
               (string-match *venv* (getenv "PYTHONPATH")))
    (setenv "PATH" (concat *venv* "bin" path-separator (getenv "PATH")))
    (setenv "PYTHONPATH" (concat (getenv "PYTHONPATH") path-separator *venv* "lib/python2.7/site-packages"))
    (setq exec-path (append exec-path (list (concat *venv* "bin")))))

  (autoload 'wisent-python-default-setup "wisent-python" "Python semantic setup." nil nil)
  (when (executable-find "linters")
    (setq python-check-command "linters"))

  (autoload 'doctest-mode "doctest-mode" "Python doctest editing mode." t)
  (setq-default tab-width '4)
  (setq-default indent-tabs-mode nil)
  (setq python-indent-offset 4)

  (when (executable-find "pyflakes")
    (use-package flycheck-pyflakes
      :ensure t
      :defer t))

  (use-package jedi
    :config
    (jedi-mode)
    (setq python-shell-virtualenv-path *venv*)
    (setq jedi:setup-keys t)
    ;; Don't let tooltip show up automatically
    (setq Jedi:get-in-function-call-delay 10000000)
    (add-hook 'python-mode-hook 'auto-complete-mode)
    (add-hook 'python-mode-hook 'jedi:setup)
    (add-hook 'python-mode-hook 'jedi:ac-setup)
    (add-to-list 'ac-sources 'ac-source-jedi-direct)
    (defun jedi-config:setup-keys ()
      (local-set-key (kbd "M-<.>") 'jedi:goto-definition)
      (local-set-key (kbd "M-<,>") 'jedi:goto-definition-pop-marker)
      (local-set-key (kbd "M-<?>") 'jedi:show-doc)
      (local-set-key (kbd "M-</>") 'jedi:get-in-function-call))
    (define-key python-mode-map (kbd "C-c <tab>") 'jedi:complete)
    (add-hook 'python-mode-hook 'jedi-config:setup-keys))

  (defun jj/pydoc (name)
    "Display pydoc information for NAME in a buffer named *pydoc*."`
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

  (define-key python-mode-map (kbd "<f5>") 'python-insert-breakpoint))

(provide 'py-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; py-conf.el ends here
