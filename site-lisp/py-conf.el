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
  (defun jj/py-hook ()
    (setq-local tab-width '4)
    (setq-local indent-tabs-mode nil)
    (autoload 'doctest-mode "doctest-mode" "Python doctest editing mode." t)
    (subword-mode +1))
  :config
  (cond ((executable-find "ipython")
         (setq python-shell-interpreter "ipython"
               python-shell-interpreter-args "--simple-prompt"))
        ((executable-find "python3")
         (setq python-shell-interpreter "python3"
               python-shell-interpreter-args "-i"
               comint-process-echoes t
               python-shell-completion-native-enable t)))
  (use-package py-yapf
    :disabled
    :after python
    :when (executable-find "yapf")
    :ensure t
    :init
    (add-hook 'python-mode-hook 'py-yapf-enable-on-save))

  (use-package anaconda-mode
    :ensure t
    :after python
    :init
    (add-hook 'python-mode-hook 'anaconda-mode)
    (add-hook 'python-mode-hook 'anaconda-eldoc-mode))

  (use-package company-anaconda
    :ensure t
    :after (anaconda-mode company)
    :init
    (add-to-list 'company-backends 'company-anaconda))

  (use-package auto-virtualenvwrapper
    :ensure t
    :init
    (add-hook 'python-mode-hook #'auto-virtualenvwrapper-activate)
    (add-hook 'projectile-after-switch-project-hook #'auto-virtualenvwrapper-activate))

  (defun jj/pydoc (name)
    "Display pydoc information for NAME in a buffer named *pydoc*."
    (interactive "sName of function or module: ")
    (switch-to-buffer-other-window "*pydoc*")
    (erase-buffer)
    (insert (shell-command-to-string (format "%s -m pydoc %s" python-shell-interpreter name)))
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
