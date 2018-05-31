;;; company
(use-package company
  :ensure t
  :commands (company-complete company-complete-common-or-cycle )
  :bind (("C-c TAB" . company-complete-common-or-cycle))
  :diminish company-mode
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-tooltip-align-annotations t))

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

(provide 'company-conf)
