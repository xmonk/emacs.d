;; setup a things for programming
(add-hook 'prog-mode-hook 'jj/pretty-lambdas)
(add-hook 'prog-mode-hook 'jj/local-comment-auto-fill)
(add-hook 'prog-mode-hook 'jj/add-watchwords)

(use-package paredit-conf)
(use-package c-conf)
(use-package elisp-conf)
(use-package lisp-conf)
(use-package c-conf)
(use-package go-conf)
(use-package org-conf)
(use-package py-conf)
(use-package sh-conf)
(use-package eshell-conf)
;; (use-package ocaml-conf :when (file-directory-p (expand-file-name "~/.op am")))
;; (use-package rust-conf :when (file-directory-p (expand-file-name "~/.cargo")))

;;; cscope
(use-package xcscope
  :ensure t
  :defer
  :init
  (add-hook 'prog-mode-hook 'cscope-minor-mode)
  (setq cscope-program "cscope")
  (setq cscope-database-regexps '(("~/.cscope/")))
  (cscope-setup))

(use-package eldoc
  :commands eldoc-mode
  :diminish eldoc-mode)

;;; projectile
(use-package projectile
  :ensure t
  :diminish projectile-mode
  :bind (("C-c p p" . projectile-switch-project))
  :functions projectile-relevant-known-projects
  :init
  (setq projectile-mode-line "Projectile")
  (projectile-mode t)
  (defun jj/show-projects ()
    "List projectile known projects in a *project* buffer."
    (interactive)
    (switch-to-buffer "*projects*")
    (org-mode)
    (insert "#+TITLE: Projects\n\n")
    (dolist (project (projectile-relevant-known-projects))
      (insert (concat "* "  "[" "[file:" project "]" "["(file-name-nondirectory (directory-file-name project)) "]" "]" "\n")))
    (goto-char (point-min))))

;;; yaml-mode
(use-package yaml-mode
  :ensure t
  :commands yaml-mode)

;;; Web-mode
(use-package web-mode
  :ensure t
  :commands web-mode
  :mode (("\\.html$" . web-mode)
         ("\\.xhtml$" . web-mode))
  :init
  (add-hook 'web-mode-hook (lambda () (setq web-mode-markup-indent-offset 2))))

;;; codesearch http://code.google.com/p/codesearch/
(use-package codesearch
  :ensure t
  :commands (listing-codesearch-search listing-codesearch-list-directories codesearch-reset codesearch-update-index codesearch-build-index)
  :init
  (setq codesearch-csearchindex ".csearchindex")
  (setq codesearch-global-csearchindex nil))

;;; flycheck
(use-package flycheck
  :ensure t
  :commands flycheck-mode
  :diminish flycheck-mode
  :functions flycheck-display-error-messages-unless-error-list
  :init
  ;; Override default flycheck triggers
  (setq flycheck-check-syntax-automatically '(save idle-change mode-enabled)
        flycheck-idle-change-delay 0.3)
  (setq flycheck-highlighting-mode 'lines)
  (setq flycheck-display-errors-function 'flycheck-display-error-messages-unless-error-list)
  :config
  (setq flycheck-checkers (--remove (eq it 'emacs-lisp-checkdoc) flycheck-checkers)))

(provide 'prog-conf)
