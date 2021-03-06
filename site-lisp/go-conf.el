;;; go-conf.el --- Go language configuration. -*- lexical-binding: t; -*-
;;
;; Filename: go-conf.el
;; Description:
;; Author: Juan Fuentes
;; Maintainer:
;; Created: Wed Nov 11 23:55:10 2009 (-0400)
;; Version:
;; Package-Requires: ()
;; Last-Updated: Wed Apr  1 21:47:47 2015 (-0400)
;;           By: Juan Fuentes
;;     Update #: 82
;; URL:
;; Doc URL:
;; Keywords:
;; Compatibility:
;;
;;
;;; Commentary:
;;
;;
;;; Change Log:
;;
;;
;;; Code:

(use-package go-mode
  :commands go-mode
  :ensure t
  :bind (:map go-mode-map
              ([remap xref-find-definitions] . godef-jump))
  :init
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook #'lsp-deferred)
  (add-hook 'go-mode-hook 'jj/go-init-hook)
  (add-hook 'go-mode-hook #'flycheck-mode)
  :config
  (setq lsp-gopls-staticcheck t)
  (setq lsp-gopls-complete-unimported t)
  ;; gofmt command
  (setq gofmt-command "goimports")

  (use-package go-errcheck
    :after go-mode
    :commands go-errcheck
    :ensure t)

  ;; Enable go-rename if available
  (use-package go-rename
    :after go-mode
    :ensure t)

  (use-package "go-guru"
    :after go-mode
    :ensure t
    :init
    (add-hook 'go-mode-hook 'go-guru-hl-identifier-mode))

  (use-package go-projectile
    :requires projectile
    :ensure t
    :commands (go-projectile-mode go-projectile-switch-project)
    :hook ((go-mode . go-projectile-mode)
           (projectile-after-swith-project . go-projectile-switch-project)))

  (defun jj/go-test()
    (interactive)
    (cd (file-name-directory (buffer-file-name)))
    (compile "go test -v"))

  (defun jj/go-run ()
    (interactive)
    (cd (file-name-directory (buffer-file-name)))
    (compile (concat "go run " (buffer-file-name))))

  (defun jj/go-init-hook()
    (subword-mode +1)
    ;; go-mode enables this by default argh!
    (flyspell-mode-off)
    (setq-local tab-width 8)
    (setq-local indent-tabs-mode t)
    (set (make-local-variable 'compile-command) (concat "go " "build" ))
    (define-key go-mode-map (kbd "C-c C-c") 'compile)))

(provide 'go-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; go-conf.el ends here
