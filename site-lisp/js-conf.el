;;; -*- lexical-binding: t; -*-
(use-package tern
  :ensure t
  :commands tern-mode
  :init
  (add-hook 'js-mode-hook (lambda () (tern-mode t))))

(use-package company-tern
  :ensure t
  :init
  (add-to-list 'company-backends 'company-tern))

(provide 'js-conf)
