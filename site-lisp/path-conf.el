;;; path-conf.el -*- lexical-binding: t; -*-

(when (memq window-system '(mac ns x))
  (use-package exec-path-from-shell
    :ensure t
    :defer
    :init
    (setq exec-path-from-shell-debug t)
    (setq exec-path-from-shell-check-startup-files nil)
    (setq exec-path-from-shell-arguments '("-l"))
    (setq exec-path-from-shell-variables '("PATH" "MANPATH" "PYTHONPATH" "GOPATH" "RUST_SRC_PATH" "RIPGREP_CONFIG_PATH"))
    (exec-path-from-shell-initialize)))

(provide 'path-conf)
