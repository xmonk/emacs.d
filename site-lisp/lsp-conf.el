;; lsp-mode

(use-package eglot
  :ensure t
  :functions jj/find-projectile-project
  :init
  ;; Integrate project.el with projectile
  (add-to-list 'project-find-functions #'jj/find-projectile-project)
  (add-hook 'python-mode-hook 'jj/activate-lsp)
  (add-hook 'bash-mode-hook 'jj/activate-lsp)
  :config
  (defun jj/activate-lsp ()
    (put 'flymake-mode 'disabled t)
    (put 'eglot-flymake-backend 'disabled t)
    (add-hook 'eglot--managed-mode-hook (lambda () (flymake-mode -1)))
    (eglot-ensure))

  (defun jj/find-projectile-project (dir)
    (if (fboundp 'projectile-project-root)
        (let ((root (projectile-project-root dir)))
          (and root (cons 'transient root))))))

(provide 'lsp-conf)
