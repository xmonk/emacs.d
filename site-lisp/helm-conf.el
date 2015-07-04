(use-package helm
  :ensure t
  :commands (helm-M-x helm-mode helm)
  :config
  (use-package helm-config)
  (use-package helm-c-moccur)
  (use-package helm-ls-git)
  (use-package helm-ls-hg)
  (use-package helm-semantic)
  (use-package helm-flycheck)
  (use-package helm-projectile)

  (helm-mode 1)
  (helm-adaptative-mode)

  (setq helm-google-suggest-use-curl-p t
	helm-scroll-amount 4 ; scroll 4 lines other window using M-<next>/M-<prior>
	helm-quick-update t ; do not display invisible candidates
	helm-idle-delay 0.01 ; be idle for this many seconds, before updating in delayed sources.
	helm-input-idle-delay 0.01 ; be idle for this many seconds, before updating candidate buffer
	helm-ff-search-library-in-sexp t ; search for library in `require' and `declare-function' sexp.

	helm-split-window-default-side 'other ;; open helm buffer in another window
	helm-split-window-in-side-p t ;; open helm buffer inside current window, not occupy whole other window
	helm-buffers-favorite-modes (append helm-buffers-favorite-modes
					    '(picture-mode artist-mode))
	helm-candidate-number-limit 200 ; limit the number of displayed canidates
	helm-M-x-requires-pattern 0     ; show all candidates when set to 0
	helm-boring-file-regexp-list
	'("\\.git$" "\\.hg$" "\\.svn$" "\\.CVS$" "\\._darcs$" "\\.la$" "\\.o$" "\\.i$") ; do not show these files in helm buffer
	helm-ff-file-name-history-use-recentf t
	helm-move-to-line-cycle-in-source t ; move to end or beginning of source
                                        ; when reaching top or bottom of source.
	ido-use-virtual-buffers t      ; Needed in helm-buffers-list
	helm-buffers-fuzzy-matching t          ; fuzzy matching buffer names when non--nil
	helm-recentf-fuzzy-match    t   ; useful in helm-mini that lists buffers
   )

  (setq helm-display-header-line nil)
  (set-face-attribute 'helm-source-header nil :height 0.1)
  (helm-autoresize-mode 1)
  (setq helm-autoresize-max-height 30)
  (setq helm-autoresize-min-height 30)
  (use-package helm-swoop
    :config
    (bind-key (kbd "C-<f1>") 'helm-swoop)
    (bind-key (kbd "C-S-<f1>") 'helm-swoop-back-to-last-point)
    (bind-key (kbd "C-<f1>") 'helm-swoop-from-isearch isearch-mode-map))

  (defun helm-toggle-header-line()
    (if (=(length helm-sources)1)
        (set-face-attribute 'helm-source-header nil :height 0.1)
      (set-face-attribute 'helm-source-header nil :height 1.0)))

  (add-hook 'helm-before-initialize-hook 'helm-toggle-header-line)

  (defun jj/helm ()
    (interactive)
    (helm :sources '(
                     helm-source-projectile-projects
                     helm-source-files-in-current-dir
                     helm-source-find-files
                     helm-source-semantic
                     helm-source-buffers-list
                     helm-source-recentf
                     helm-source-flycheck
                     )
          :buffer "*helm*"
          :prompt "> "))

  (global-set-key (kbd "C-c h") 'helm-command-prefix)
  (global-unset-key (kbd "C-x c"))
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
  (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

  (when (executable-find "curl")
    (setq helm-google-suggest-use-curl-p t))

  (global-set-key [f2] 'jj/helm)
  (global-set-key [S-f1] 'helm-do-grep)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring))

(provide 'helm-conf)
