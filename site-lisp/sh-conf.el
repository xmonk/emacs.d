(defun jj/sh-hook ()
  "personal shell hook"
  (setq-default tab-width 4)
  (setq-default indent-tabs-mode t)
  (setq sh-basic-offset 4
	sh-indentation 4
	sh-indent-for-case-label 0
	sh-indent-for-case-alt '+))

(add-hook 'shell-script-mode 'jj/sh-hook)
(add-hook 'sh-mode-hook 'jj/sh-hook)
(provide 'sh-conf)
