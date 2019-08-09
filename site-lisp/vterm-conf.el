
(use-package vterm
  :commands vterm
  :ensure t
  :bind (:map vterm-mode-map ("C-y" . vterm-yank)))

(provide 'vterm-conf)
