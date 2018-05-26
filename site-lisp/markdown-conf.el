;;; Markdown
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init
  (setq markdown-command "multimarkdown"
        markdown-fontify-code-blocks-natively t
        markdown-enable-math t
        markdown-header-scaling t
        markdown-hide-urls t
        markdown-marginalize-headers t
        markdown-marginalize-headers-margin-width 4
        markdown-fontify-code-blocks-natively t)
  (add-hook 'markdown-mode-hook #'flyspell-mode))

(provide 'markdown-conf)
