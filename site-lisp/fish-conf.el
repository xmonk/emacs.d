;;; fish shell
(use-package fish-mode
  :ensure t
  :commands fish-mode
  :when (executable-find "fish"))

(use-package fish-completion
  :ensure t
  :when (executable-find "fish")
  :config
  (global-fish-completion-mode))

(provide 'fish-conf)
