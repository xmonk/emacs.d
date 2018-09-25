;;; company
(use-package company
  :ensure t
  :commands (company-mode company-complete)
  :bind (("C-c TAB" . company-complete-common-or-cycle))
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
  (setq  company-begin-commands nil)
  (setq company-minimum-prefix-length 3)
  (company-flx-mode +1)
  (add-hook 'company-mode-hook (lambda () (add-to-list 'company-backends 'company-capf))))

(use-package ycmd
  :ensure t
  ;; :diminish (ycmd-mode eldoc-mode)
  :init
  ; Remember to customize this variable for your environment
  (set-variable 'ycmd-server-command `("python3" ,(file-truename "~/t/ycmd/ycmd/")))
  (add-hook 'ycmd-mode-hook 'ycmd-eldoc-setup))

(use-package company-ycmd
  :ensure t
  :commands company-ycmd
  :init (company-ycmd-setup))

(provide 'company-conf)
