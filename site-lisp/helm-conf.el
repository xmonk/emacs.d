;;; helm-conf.el ---  Helm configuration
;;
;; Filename: helm-conf.el
;; Description:
;; Author: Juan Fuentes
;; Maintainer:
;; Created: Sat Jul  4 18:43:48 2015 (-0400)
;; Version:
;; Package-Requires: ()
;; Last-Updated:
;;           By:
;;     Update #: 7
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


(use-package helm
  :disabled
  :ensure t
  :bind (("C-x b" . helm-mini))
  :diminish helm-mode
  :init
  (helm-mode 1)
  :config
  (use-package helm-config)
  (use-package helm-c-moccur :ensure t :defer 5)
  (use-package helm-ls-git :ensure t :defer 5)
  (use-package helm-ls-hg :ensure t :defer 5)
  (use-package helm-semantic)
  (use-package helm-flycheck :ensure t :defer)
  (use-package helm-projectile :ensure t :defer)

  (setq helm-google-suggest-use-curl-p t
		    helm-scroll-amount 4 ; scroll 4 lines other window using M-<next>/M-<prior>
		    helm-quick-update t ; do not display invisible candidates
		    helm-idle-delay 0.01 ; be idle for this many seconds, before updating in delayed sources.
		    helm-input-idle-delay 0.01 ; be idle for this many seconds, before updating candidate buffer
		    helm-ff-search-library-in-sexp t ; search for library in `require' and `declare-function' sexp.

		    helm-split-window-default-side 'other ; open helm buffer in another window
		    helm-split-window-in-side-p t ; open helm buffer inside current window, not occupy whole other window
		    helm-buffers-favorite-modes (append helm-buffers-favorite-modes
											                      '(picture-mode artist-mode))
		    helm-candidate-number-limit 200 ; limit the number of displayed canidates
		    helm-M-x-requires-pattern 0     ; show all candidates when set to 0
		    helm-M-x-fuzzy-match t
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
    :disabled
    :config
    (bind-key (kbd "C-c h s") 'helm-swoop)
    (bind-key (kbd "C-c h C-s") 'helm-swoop-back-to-last-point)
    (bind-key (kbd "C-<f1>") 'helm-swoop-from-isearch isearch-mode-map))

  (use-package swiper-helm
    :ensure t
    :bind (("C-c h s" . swiper-helm)
		       ("C-c h C-s" . swiper-helm-from-isearch)))

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
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; ebind tab to run persistent action
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
  (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
  (global-set-key (kbd "C-x C-m") 'helm-M-x)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (when (executable-find "curl")
    (setq helm-google-suggest-use-curl-p t))

  (global-set-key (kbd "C-c h j") 'jj/helm)
  (global-set-key (kbd "C-c h g") 'helm-do-grep)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring))

(provide 'helm-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; helm-conf.el ends here
