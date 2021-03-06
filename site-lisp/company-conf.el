;;; company -*- lexical-binding: t; -*-
(use-package company
  :ensure t
  :commands (company-mode company-complete)
  :bind (("C-'" . company-complete)
         ("<backtab>" . company-yasnippet)
         :map company-active-map
         ("C-p" . company-select-previous)
         ("C-n" . company-select-next)
         ("<tab>" . company-complete-common-or-cycle)
         ("<backtab>" . my-company-yasnippet)
         ;; ("C-c C-y" . my-company-yasnippet)
         :map company-search-map
         ("C-p" . company-select-previous)
         ("C-n" . company-select-next))

  :diminish company-mode
  :init
  (setq company-tooltip-align-annotations t)
  (setq company-require-match nil)
  (setq company-dabbrev-other-buffers t)
  (setq company-dabbrev-code-other-buffers t)
  (setq company-complete-number t)
  (setq company-show-numbers t)
  (setq company-selection-wrap-around t)
  (setq company-dabbrev-downcase nil)
  (setq company-dabbrev-ignore-case t)

  :config
  (global-company-mode 1))

(use-package company-flx
  :ensure t
  :commands company-flx-mode
  :after company
  :init
  (setq company-tooltip-limit 20)
  (setq company-idle-delay .3)
  (setq company-echo-delay 0)
  (setq company-auto-commit nil)
  (setq company-begin-commands nil)
  (setq company-minimum-prefix-length 3)
  (add-hook 'company-mode-hook (lambda () (add-to-list 'company-backends 'company-capf)))
  :config
  (company-flx-mode +1))

(use-package company-quickhelp
  :ensure t
  :defines company-quickhelp-delay
  :bind (:map company-active-map
              ("M-h" . company-quickhelp-manual-begin))
  :hook (global-company-mode . company-quickhelp-mode)
  :init (setq company-quickhelp-delay 0.8))

(use-package company-posframe
  :ensure t
  :diminish company-posframe-mode
  :hook (company-mode . company-posframe-mode))

(provide 'company-conf)
