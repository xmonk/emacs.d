(load-file (concat user-emacs-directory "site-lisp" "/" "pragmatapro-prettify-symbols-v0.827.el"))
(add-hook 'prog-mode-hook #'add-pragmatapro-prettify-symbols-alist)
(global-prettify-symbols-mode +1)

(provide 'fonts-conf)
