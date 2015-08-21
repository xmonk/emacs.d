
(use-package auto-complete
  :disabled
  :diminish auto-complete-mode
  :config
  (ac-config-default)
  (require 'auto-complete-config nil t)

  (ac-flyspell-workaround)
  (setq ac-auto-start nil)
  (setq-default ac-dwim nil)
  (add-to-list 'ac-dictionary-directories (concat user-emacs-directory "auto-complete/dict"))
  (setq ac-comphist-file (concat user-emacs-directory "ac-comphist.dat"))
  (add-to-list 'completion-styles 'initials t)
  (define-key ac-mode-map (kbd "C-c TAB") 'auto-complete)
  (setq ac-use-menu-map t)
  ;; Default settings
  (define-key ac-menu-map "\C-n" 'ac-next)
  (define-key ac-menu-map "\C-p" 'ac-previous)
  (define-key ac-mode-map (kbd "M-s") 'ac-isearch)
  (define-key ac-mode-map [f1] 'ac-help)
  (define-key ac-mode-map [M-f1] 'ac-persist-help)
  (define-key ac-mode-map (kbd "C-<?>") 'ac-help)
  (define-key ac-mode-map (kbd "C-M-<?>") 'ac-persist-help)
  ;; (ac-set-trigger-key "TAB")
  (set-default 'ac-sources
               '(;;ac-source-dictionary
                 ac-source-words-in-buffer
                 ac-source-words-in-same-mode-buffers
                 ac-source-words-in-all-buffer
                 ac-source-semantic-raw
                 ac-source-semantic)))

(provide 'ac-conf)
