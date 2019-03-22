;;; go-conf.el --- Go language configuration.
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
  :init
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook 'jj/go-init-hook)
  (add-hook 'go-mode-hook #'flycheck-mode)
  (add-hook 'go-mode-hook 'ycmd-mode)
  :config
  (setenv "GOPATH" (concat (getenv "HOME") "/g"))
  ;; gofmt command
  (setq gofmt-command "goimports")

  (use-package go-eldoc
    :after go-mode
    :ensure t
    :init
    (when (file-executable-p (file-truename "~/.emacs.d/ycmd/third_party/go/src/github.com/mdempsky/gocode/gocode"))
      (setq go-eldoc-gocode (file-truename "~/.emacs.d/ycmd/third_party/go/src/github.com/mdempsky/gocode/gocode")))
    (add-hook 'go-mode-hook 'go-eldoc-setup)
    :config
    (eldoc-mode))



  (use-package go-errcheck
    :after go-mode
    :commands go-errcheck
    :ensure t)

  (use-package company-go
    :ensure t
    :after (go-mode company)
    :init
    (add-to-list 'company-backends 'company-go)
    (setq company-go-show-annotation t)
    (setq company-tooltip-align-annotations t)
    (when (file-executable-p (file-truename "~/.emacs.d/ycmd/third_party/go/src/github.com/mdempsky/gocode/gocode"))
      (setq company-go-gocode-command (file-truename "~/.emacs.d/ycmd/third_party/go/src/github.com/mdempsky/gocode/gocode"))))

  ;; Enable go-rename if available
  (use-package go-rename
    :after go-mode
    :ensure t)

  (use-package "go-guru"
    :after go-mode
    :ensure t
    :init
    (add-hook 'go-mode-hook 'go-guru-hl-identifier-mode))

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
