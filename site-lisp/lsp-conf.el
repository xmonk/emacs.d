;; lsp-mode

(use-package lsp-mode
  :ensure t
  :commands lsp
  :init
  (add-hook 'python-mode-hook #'lsp))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package company-lsp
  :ensure t
  :commands company-lsp
  :config
  (setq company-lsp-enable-recompletion t)
  (setq company-lsp-async t)
  (setq company-lsp-cache-candidates t))

(provide 'lsp-conf)
