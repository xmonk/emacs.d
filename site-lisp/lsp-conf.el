;; lsp-mode -*- lexical-binding: t; -*-

(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook ((python-mode . lsp)
         (go-mode . lsp)
         (shell-script-mode . lsp)
         (java-mode . lsp))
  :bind (:map lsp-mode-map
              ("M-." . lsp-find-definition)
              ("M-r" . lsp-find-references)
              ("S-r" . lsp-rename)
              ("C-c C-d" . lsp-describe-thing-at-point))
  :init
  (setq lsp-auto-guess-root t)
  (setq lsp-prefer-flymake nil)
  (setq flymake-fringe-indicator-position 'right-fringe)
  (setq lsp-enable-snippet nil)
  :config
  (use-package lsp-java
    :ensure t
    :after lsp
    :config
    (add-hook 'java-mode-hook 'lsp))

  (use-package lsp-clients
    :init
    (setq lsp-clients-python-library-directories '("/user/local/" "/usr/")))

  (use-package lsp-ui
    :ensure t
    :commands lsp-ui-mode
    :bind (:map lsp-ui-mode-map
                ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
                ([remap xref-find-references] . lsp-ui-peek-find-references)
                ("C-c u" . lsp-ui-imenu))
    :init (setq lsp-ui-doc-enable t
                lsp-ui-doc-header t
                lsp-ui-doc-include-signature t
                lsp-ui-doc-position 'top
                lsp-ui-doc-use-webkit t
                lsp-ui-doc-border (face-foreground 'default)

                lsp-ui-sideline-enable nil
                lsp-ui-sideline-ignore-duplicate t)
    :config
    ;; WORKAROUND Hide mode-line of the lsp-ui-imenu buffer
    ;; https://github.com/emacs-lsp/lsp-ui/issues/243
    (defadvice lsp-ui-imenu (after hide-lsp-ui-imenu-mode-line activate)
      (setq mode-line-format nil)))

  (use-package company-lsp
    :ensure t
    :commands company-lsp
    :init
    (setq company-lsp-enable-recompletion t)
    (setq company-lsp-async t)
    (setq company-lsp-cache-candidates 'auto)))

(use-package dap-mode
  :ensure t
  :commands (dap-mode dap-breakpoint-add)
  :config
  (dap-mode 1)
  (dap-ui-mode 1)
  (require 'dap-python)
  (require 'dap-java))

(provide 'lsp-conf)
