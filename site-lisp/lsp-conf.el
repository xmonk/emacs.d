;; lsp

(use-package lsp-mode
  :ensure t
  :commands lsp-mode
  :init
  (lsp-mode))

(use-package lsp-imenu
  :after lsp-mode
  :init
  (add-hook 'lsp-after--open-hook 'lsp-enable-imenu))

(use-package lsp-ui
  :ensure t
  :defines lsp-ui-sideline-ignore-duplicates
  :init
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  (setq lsp-ui-sideline-ignore-duplicates t))

(use-package company-lsp
  :ensure t
  :after (company lsp-mode)
  :init
  (add-to-list 'company-backends 'company-lsp))

;; go
(use-package lsp-go
  :disabled
  :ensure t
  :defines lsp-go-enable
  :init
  (add-hook 'go-mode-hook #'lsp-go-enable)
  (lsp-define-stdio-client lsp-go "go"
                           #'jj/pwd
                           '("go-langserver" "-gocodecompletion" "-mode=stdio" "-func-snippet-enabled=false")))

;; python
(use-package lsp-python
  :ensure t
  :commands lsp-python-enable
  :after lsp-mode
  :defines lsp-python-enable
  :functions (jj/pwd lsp-python-enable lsp--as-regex lsp--enable-stdio-client)
  :init
  (add-hook 'python-mode-hook #'lsp-python-enable)
  (lsp-define-stdio-client lsp-python "python"
                           #'jj/pwd
                           '("pyls")))


(provide 'lsp-conf)
