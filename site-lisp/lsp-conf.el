;; lsp-mode

(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook ((python-mode bash-mode) . lsp)
  :init
  (setq lsp-auto-guess-root t)
  (setq lsp-prefer-flymake nil)
  :config
  (require 'lsp-clients)
  (define-key lsp-mode-map (kbd "M-.") 'lsp-find-definition)
  (define-key lsp-mode-map (kbd "M-r") 'lsp-find-references)
  (define-key lsp-mode-map (kbd "S-r") 'lsp-rename))

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

(use-package dap-mode
  :ensure t
  :config
  (dap-mode 1)
  (dap-ui-mode 1)
  (require 'dap-python))

(provide 'lsp-conf)
