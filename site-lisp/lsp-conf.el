;; lsp

(use-package lsp-mode
  :disabled
  :commands (lsp-mode lsp-python-enable)
  :init
  (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)
  (add-hook 'python-mode-hook (lambda () (lsp-python-enable)))
  :config
  (use-package lsp-imenu :after lsp-mode)
  (lsp-define-stdio-client lsp-python "python"
                           #'jj/pwd
                           ;; #'projectile-project-root
                           '("pyls")))

(use-package lsp-ui
  :disabled
  :after lsp-mode
  :init
  (setq lsp-ui-sideline-ignore-duplicate t)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package company-lsp
  :disabled
  :after lsp-mode
  :init
  (add-hook 'company-mode-hook (lambda () (add-to-list 'company-backends 'company-lsp)))
  (add-hook 'lsp-after-initialize-hook 'lsp-set-cfg)
  (defun lsp-set-cfg ()
    (let ((lsp-cfg `(:pyls (:configurationSources ("flake8")))))
      ;; TODO: check lsp--cur-workspace here to decide per server / project
      (lsp--set-configuration lsp-cfg))))

(provide 'lsp-conf)
