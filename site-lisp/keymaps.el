;;; keymaps.el --- Personal key maps.  -*- lexical-binding: t; -*-
;;
;; Filename: keymaps.el
;; Description:
;; Author: Juan Fuentes
;; Maintainer:
;; Created: Sat Apr 18 14:13:55 2015 (-0400)
;; Version:
;; Package-Requires: ()
;; Last-Updated: Sat Apr 18 14:14:22 2015 (-0400)
;;           By:
;;     Update #: 2
;; URL:
;; Doc URL:
;; Keywords:
;; Compatibility:
;;
;;
;;; Commentary:
;;
;;
;;; Change Log:
;;
;;
;;; Code:

(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-x m") 'execute-extended-command)
(global-set-key (kbd "C-a") 'beginning-of-line-dwim)
(global-set-key (kbd "C-c C-f") 'ffap)
(global-set-key (kbd "C-c f") 'ffap)
;; (global-set-key (kbd "C-c m") 'gnus)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-x k") 'jj/kill-buffer)
(global-set-key (kbd "C-;") #'endless/comment-line-or-region)
(define-key ctl-x-map "\C-i" #'endless/ispell-word-then-abbrev)
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-c C-k") 'kill-region)
(global-set-key (kbd "C-c j") 'join-line)
(global-set-key (kbd "M-<up>") 'jj/move-line-up)
(global-set-key (kbd "M-<down>") 'jj/move-line-down)
(global-set-key (kbd "C-o") 'jj/vi-open-next-line)
(global-set-key (kbd "C-S-o") 'jj/vi-open-previous-line)
(global-set-key (kbd "C-%") 'jj/match-paren)
(global-set-key (kbd "M-<?!>") 'custom-shell-command-on-region)
(global-set-key (kbd "s-e") 'jj/esh)
(global-set-key (kbd "s-t") 'jj/vterm)
(global-set-key (kbd "M-/") 'hippie-expand)
;; multiframe movements..
;; (global-set-key (kbd "C-c w n") 'next-multiframe-window)
;; (global-set-key (kbd "C-c w p") 'previous-multiframe-window)
;; This might conflict in certain modes.
(global-set-key (kbd "C-c h b") 'outline-hide-body)
(global-set-key (kbd "C-c s b") 'outline-show-all)
(global-set-key (kbd "C-c h f") 'outline-hide-entry)
(global-set-key (kbd "C-c s f") 'outline-show-entry)

;; Use dired instead of list-directory.
(global-set-key (kbd "C-x C-d") 'dired-jump)

;; zap to chars
(global-set-key (kbd "M-z") 'zap-to-char)
(global-set-key (kbd "M-Z") 'zap-up-to-char)

;; GUI specific keymaps
(when window-system
  (global-set-key (kbd "<f11>") 'jj/fullscreen))

(provide 'keymaps)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; keymaps.el ends here
