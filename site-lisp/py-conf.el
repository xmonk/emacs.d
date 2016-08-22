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
  :config

  (setq python-shell-interpreter "ipython"
	python-shell-interpreter-args "--simple-prompt --pprint")

  (autoload 'doctest-mode "doctest-mode" "Python doctest editing mode." t)
  (setq-default tab-width '4)
  (setq-default indent-tabs-mode nil)
  (subword-mode +1)
  (when (executable-find "pyflakes")
    (use-package flycheck-pyflakes
      :ensure t
      :init
      (add-hook 'python-mode-hook #'flycheck-mode)))

  (when (executable-find "yapf")
    (use-package py-yapf
      :ensure t
      :init
      (add-hook 'python-mode-hook 'py-yapf-enable-on-save)))

  (use-package anaconda-mode
    :ensure t
    :config
    ;; (setq python-shell-virtualenv-path *venv*)
    (use-package company
      :init
      (add-hook 'python-mode-hook 'anaconda-mode)
      (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
      (use-package company-anaconda
        :ensure t
        :init
        (add-to-list 'company-backends 'company-anaconda))))

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

  (define-key python-mode-map (kbd "<f5>") 'python-insert-breakpoint)

  (defun python-set-venv (venv)
    (interactive "GPath: ")
    ;; set path pythonpath and exec-path if *venv* is not set in $PATH and $PYTHONPATH.
    (defvar *venv* (expand-file-name venv))
    (unless (and (file-directory-p *venv*) (string-match *venv* (getenv "PATH"))
                 (string-match *venv* (getenv "PYTHONPATH")))
      (setenv "PATH" (concat *venv* "/bin" path-separator (getenv "PATH")))
      (setenv "PYTHONPATH" (concat (getenv "PYTHONPATH") path-separator *venv* "lib/python3.5/site-packages"))
      (setq exec-path (append exec-path (list (concat *venv* "bin")))))))

(provide 'py-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; py-conf.el ends here
