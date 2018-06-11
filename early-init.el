(setq inhibit-startup-message t)
(setq package-enable-at-startup t)
(setq package-quickstart t)
(package-initialize)

(when (window-system)
  ;; set font
  (if (= 5760 (display-pixel-width))
      (set-face-attribute 'default nil :font "PragmataPro" :height (floor (* 10 9.5)))
    (set-face-attribute 'default nil :font "PragmataPro" :height (floor (* 10 11.5))))
  (setenv "RIPGREP_CONFIG_PATH" (concat (getenv "HOME") "/" ".ripgreprc")))
