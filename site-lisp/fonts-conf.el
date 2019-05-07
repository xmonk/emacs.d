;; -*- lexical-binding: t; -*-

(load-library (concat user-emacs-directory "vendor" "/" "pragmatapro-prettify-symbols-v0.827.el"))
(add-hook 'prog-mode-hook #'add-pragmatapro-prettify-symbols-alist)
(add-hook 'markdown-mode-hook #'add-pragmatapro-prettify-symbols-alist)
(add-hook 'text-mode-hook #'add-pragmatapro-prettify-symbols-alist)

(global-prettify-symbols-mode +1)

;; (use-package pragmata-pro
;;   :load-path "vendor/pragmata-pro/"
;;   :diminish
;;   :config
;;   (pragmata-pro-mode)
;;   (global-prettify-symbols-mode +1))


(provide 'fonts-conf)
