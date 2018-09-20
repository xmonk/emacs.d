;;; company

(use-package company
  :ensure t
  :commands (company-mode company-complete)
  :bind (("C-c TAB" . company-complete))
  :diminish company-mode
  :init
  (setq company-tooltip-align-annotations t)
  (global-company-mode 1))

(use-package company-flx
  :ensure t
  :commands company-flx-mode
  :after company
  :init
  (setq company-tooltip-limit 20)
  (setq company-idle-delay .3)
  (setq company-echo-delay 0)
  (setq company-auto-complete nil)
  (setq company-begin-commands nil)
  (setq company-minimum-prefix-length 3)
  (company-flx-mode +1)
  (add-hook 'company-mode-hook (lambda () (add-to-list 'company-backends 'company-capf))))

(use-package ycmd
  :ensure t
  ;; :diminish (ycmd-mode eldoc-mode)
  :init
  (set-variable 'ycmd-server-command `("python3" ,(file-truename "~/t/ycmd/ycmd/")))
  (add-hook 'ycmd-mode-hook 'ycmd-eldoc-setup)
  (add-hook 'python-mode-hook 'ycmd-mode)
  (add-hook 'go-mode-hook 'ycmd-mode))

(use-package company-ycmd
  :ensure t
  :init (company-ycmd-setup))

(provide 'company-conf)
