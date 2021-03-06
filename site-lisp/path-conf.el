;;; path-conf.el -*- lexical-binding: t; -*-

(when (memq window-system '(mac ns x))
  (use-package exec-path-from-shell
    :ensure t
    :init
    (setq exec-path-from-shell-variables '("PATH" "MANPATH" "PYTHONPATH" "GOPATH" "RUST_SRC_PATH" "RIPGREP_CONFIG_PATH" "WORKON_HOME"))
    (exec-path-from-shell-initialize)))

(provide 'path-conf)
