
(unless (locate-library "smex")
  (global-set-key (kbd "C-x C-m") 'execute-extended-command)
  (global-set-key (kbd "C-x m") 'execute-extended-command))

(global-set-key (kbd "C-c m") 'gnus)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-x k") 'jj/kill-buffer)
(global-set-key (kbd "C-;") #'endless/comment-line-or-region)
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c C-k") 'kill-region)
(global-set-key (kbd "C-c j") 'join-line)
(global-set-key (kbd "M-<up>") 'jj/move-line-up)
(global-set-key (kbd "M-<down>") 'jj/move-line-down)
(global-set-key (kbd "C-o") 'jj/vi-open-next-line)
(global-set-key (kbd "C-S-o") 'jj/vi-open-previous-line)
(global-set-key (kbd "M-<?!>") 'custom-shell-command-on-region)
(global-set-key (kbd "s-s") 'jj/esh)
(global-set-key (kbd "C-c w") 'jj/ido-jump-to-window)

;; This might conflict in certain modes.
(global-set-key (kbd "C-c h b") 'outline-hide-body)
(global-set-key (kbd "C-c s b") 'outline-show-all)
(global-set-key (kbd "C-c h f") 'outline-hide-entry)
(global-set-key (kbd "C-c s f") 'outline-show-entry)

;; zap to chars
(global-set-key (kbd "M-z") 'zap-to-char)
(global-set-key (kbd "M-Z") 'zap-up-to-char)

;; GUI specific keymaps
(when window-system
  (global-set-key [(control ?=)] (lambda() (interactive) (text-scale-increase 1)))
  (global-set-key [(control ?-)] (lambda() (interactive) (text-scale-decrease 1)))
  (global-set-key [(control ?0)] (lambda() (interactive) (text-scale-increase 0)))
  (global-set-key (kbd "<f11>") 'jj/fullscreen))

(provide 'keymaps)
