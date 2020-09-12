;;; prog-mode.el -*- lexical-binding: t; -*-
;; setup a things for programming
(add-hook 'prog-mode-hook 'jj/local-comment-auto-fill)
(add-hook 'prog-mode-hook 'jj/add-watchwords)

(use-package eldoc
  :commands eldoc-mode
  :diminish eldoc-mode)

;;; yaml-mode
(use-package yaml-mode
  :ensure t
  :mode ("\\.yml$" . yaml-mode)
  :commands yaml-mode)

;;; Web-mode
(use-package web-mode
  :ensure t
  :commands web-mode
  :mode (("\\.html$" . web-mode)
         ("\\.xhtml$" . web-mode))
  :init
  (add-hook 'web-mode-hook (lambda () (setq web-mode-markup-indent-offset 2))))

(use-package json-mode
  :ensure t
  :mode (("\\.json$" . json-mode))
  :custom
  (flycheck-json-python-json-executable "/usr/bin/python3")
  :hook (json-mode . flycheck-mode)
  :init
  (add-hook 'json-mode '(lambda ()
                          (setq-local indent-tabs-mode nil)
                          (setq-local tab-width 2)
                          (setq json-reformat:indent-width '2))))
;;; flycheck
(use-package flycheck
  :ensure t
  :commands flycheck-mode
  :diminish flycheck-mode
  :functions flycheck-display-error-messages-unless-error-list
  :init
  ;; Override default flycheck triggers
  (setq flycheck-check-syntax-automatically '(save idle-change mode-enabled))
  (setq flycheck-idle-change-delay 0.3)
  (setq flycheck-highlighting-mode 'lines)
  (setq flycheck-display-errors-function 'flycheck-display-error-messages-unless-error-list)
  :config
  (setq flycheck-checkers (--remove (eq it 'emacs-lisp-checkdoc) flycheck-checkers)))

;;; restclient
(use-package restclient
  :ensure t
  :commands restclient-mode
  :mode ("\\.restclient\\'" . restclient-mode))

(use-package dumb-jump
  :ensure t
  :diminish
  :init
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
  (unbind-key "C-M-p" dumb-jump-mode-map)
  (setq dumb-jump-selector 'ivy)
  (setq dumb-jump-force-searcher 'rg))

(use-package smart-jump
  :ensure t
  :config
  (smart-jump-setup-default-registers))

(use-package sr-speedbar
  :disabled
  :ensure t
  :bind (("s-s" . sr-speedbar-toggle))
  :init
  (setq sr-speedbar-right-side nil))

(provide 'prog-conf)
