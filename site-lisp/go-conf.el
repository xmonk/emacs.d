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
  :config
  (setenv "GOPATH" (concat (getenv "HOME") "/g"))
  ;; gofmt command
  (setq gofmt-command "goimports")

  (use-package go-eldoc
    :ensure t
    :config
    (add-hook 'go-mode-hook 'go-eldoc-setup))

  (use-package go-errcheck
    :commands go-errcheck
    :ensure t)

  (load-after company
    (use-package company-go
      :ensure t
      :config
      (add-to-list 'company-backends '(company-go))
      (bind-key "C-c TAB" 'company-complete go-mode-map)))

  ;; compile and run go code.
  (defmacro jj:go(cmd)
    `(lambda()
       (interactive)
       (compile (concat ,cmd (buffer-file-name)))))

  (defun jj/go-test()
    (interactive)
    (cd (file-name-directory (buffer-file-name)))
    (compile "go test -v"))

  (defun jj/go-init-hook()
    ;; go-mode enables this by default argh!
    (flyspell-mode-off)
    (setq-default tab-width 8)
    (setq-default indent-tabs-mode t)
    (bind-key "C-c C-c" (jj:go "go build ") go-mode-map)
    (bind-key "C-c C-e" (jj:go "go run ") go-mode-map)
    (bind-key "C-c ." 'godoc-at-point go-mode-map)
    (bind-key "C-c C-t" 'jj/go-test go-mode-map)
    (add-hook 'before-save-hook 'gofmt-before-save)

    ;; Enable go-oracle-mode if available
    (let ((oracle (executable-find "oracle")))
      (when oracle
        (setq load-path (cons (concat (getenv "GOPATH") "/src/golang.org/x/tools/cmd/oracle") load-path))
        (when (locate-library "oracle")
          (require 'go-oracle "oracle")
          (setq go-oracle-command "oracle"))))

    ;; Enable go-rename if available
    (let ((*gorename* (concat (getenv "GOPATH") "/src/golang.org/x/tools/refactor/rename")))
      (when (file-directory-p *gorename*)
        (setq load-path (cons *gorename* load-path))
        (when (locate-library "rename")
          (load-library "rename")))))

  (add-hook 'go-mode-hook 'jj/go-init-hook))

(provide 'go-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; go-conf.el ends here
