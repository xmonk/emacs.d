;; lsp-mode -*- lexical-binding: t; -*-

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook ((python-mode . lsp)
         (go-mode . lsp)
         (shell-script-mode . lsp))
  :bind (:map lsp-mode-map
              ("M-." . lsp-find-definition)
              ("M-r" . lsp-find-references)
              ("s-r" . lsp-rename)
              ("C-c C-d" . lsp-describe-thing-at-point))
  :init
  (setq lsp-auto-guess-root t)
  (setq lsp-enable-snippet nil)
  (setq lsp-eldoc-render-all t)
  :config
  (use-package lsp-java
    :ensure t
    :after lsp
    :config
    (add-hook 'java-mode-hook 'lsp))

  (use-package lsp-ui
    :ensure t
    :commands lsp-ui-mode
    :bind (:map lsp-ui-mode-map
                ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
                ([remap xref-find-references] . lsp-ui-peek-find-references)
                ("C-c u" . lsp-ui-imenu)
                ("M-r" . xref-find-references))
    :init (setq lsp-ui-doc-enable nil
                lsp-ui-doc-header nil
                lsp-ui-doc-include-signature nil
                lsp-ui-doc-position 'top
                lsp-ui-doc-use-webkit nil
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

(use-package lsp-python-ms
  :ensure t
  :init (setq lsp-python-ms-auto-install-server t))


(provide 'lsp-conf)
