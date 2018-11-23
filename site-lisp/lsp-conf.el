;; lsp-mode

(use-package eglot
  :ensure t
  :functions jj/find-projectile-project
  :init
  ;; Integrate project.el with projectile
  (add-to-list 'project-find-functions #'jj/find-projectile-project)
  (add-hook 'python-mode-hook 'jj/activate-lsp)
  (add-hook 'sh-mode-hook 'jj/activate-lsp)

  (defun jj/activate-lsp ()
    (flycheck-mode 0)
    (eglot-ensure))

  (defun jj/find-projectile-project (dir)
    (if (fboundp 'projectile-project-root)
        (let ((root (projectile-project-root dir)))
          (and root (cons 'transient root))))))

(provide 'lsp-conf)
