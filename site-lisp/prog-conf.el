;; setup prog hooks.
(add-hook 'prog-mode-hook 'jj/pretty-lambdas)
(add-hook 'prog-mode-hook 'jj/local-comment-auto-fill)
(add-hook 'prog-mode-hook 'jj/add-watchwords)

;; load programming configs.
(use-package elisp-conf)
(use-package lisp-conf )
(use-package c-conf)
(use-package go-conf)
(use-package py-conf)
(use-package eshell-conf)
(use-package sh-conf)
(use-package ocaml-conf :when (file-directory-p (expand-file-name "~/.opam")))
(use-package rust-conf :when (file-directory-p (expand-file-name "~/.cargo")))

;;; cscope
(use-package xcscope
  :ensure t
  :defer
  :init
  (add-hook 'prog-mode-hook 'cscope-minor-mode)
  (setq cscope-program "cscope")
  (setq cscope-database-regexps '(("~/.cscope/")))
  (cscope-setup))

;;; ggtags
(use-package ggtags
  :ensure t
  :init
  (add-hook 'c-mode-common-hook
            (lambda ()
              (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
                (ggtags-mode 1))))
  (add-hook 'python-mode-hook (lambda () (ggtags-mode 1))))

;;; eldoc
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

;;; paredit
(use-package paredit
  :ensure t
  :commands paredit-mode
  :diminish paredit-mode
  :config
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


(provide 'prog-conf)
