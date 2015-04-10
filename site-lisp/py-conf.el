;;; py-conf.el ---
;;
;; Filename: py-conf.el
;; Description:
;; Author: Juan Fuentes
;; Maintainer:
;; Created: Thu Apr 28 19:54:14 2011 (-0400)
;; Version:
;; Package-Requires: (jedi, epc, auto-complete, flycheck)
;; Last-Updated: Wed Apr  1 21:48:45 2015 (-0400)
;;           By:
;;     Update #: 112
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

;; set path pythonpath and exec-path if *venv* is not set in $PATH and $PYTHONPATH.

(load-after python
  (defvar *venv* (concat (getenv "HOME") "/.venv/"))
  (unless (and (file-directory-p *venv*) (string-match *venv* (getenv "PATH"))
               (string-match *venv* (getenv "PYTHONPATH")))
    (setenv "PATH" (concat (concat *venv* "bin:") (getenv "PATH")))
    (setenv "PYTHONPATH" (concat (concat (getenv "PYTHONPATH") ":") (concat *venv* "lib/python2.7/site-packages")))
    (setq exec-path (append exec-path (list (concat *venv* "bin")))))

  (when (executable-find "linters")
    (setq python-check-command "linters"))

  (autoload 'doctest-mode "doctest-mode" "Python doctest editing mode." t)
  (setq-default tab-width '4)
  (setq-default indent-tabs-mode nil)
  (setq python-indent-offset 4)

  ;; (setq python-shell-interpreter "ipython"
  ;;       python-shell-interpreter "ipython"
  ;;       python-shell-interpreter-args ""
  ;;       python-shell-prompt-regexp "In \\[[0-9]+\\]: "
  ;;       python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
  ;;       python-shell-completion-setup-code
  ;;       "from IPython.core.completerlib import module_completion"
  ;;       python-shell-completion-module-string-code
  ;;       "';'.join(module_completion('''%s'''))\n"
  ;;       python-shell-completion-string-code
  ;;       "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

  (when (executable-find "pyflakes")
    (use-package flycheck-pyflakes
      :ensure t
      :defer t))

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
