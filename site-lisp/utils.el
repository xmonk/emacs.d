;;; ibuffer
(use-package ibuffer
  :commands ibuffer)

(use-package ibuffer-vc
  :ensure t
  :defer
  :after ibuffer
  :functions ibuffer-do-sort-by-alphabetic
  :init
  (defun jj/ibuffer-vc-setup ()
    (ibuffer-vc-set-filter-groups-by-vc-root)
    (unless (eq ibuffer-sorting-mode 'alphabetic)
      (ibuffer-do-sort-by-alphabetic)))
  ;; make ibuffer the default
  (defalias 'list-buffers 'ibuffer)
  (add-hook 'ibuffer-hook 'jj/ibuffer-vc-setup))

;;; diminish
(use-package diminish
  :commands diminish
  :ensure t)

(use-package git-timemachine
  :ensure t
  :commands git-timemachine)

;;; undo-tree
(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :commands undo-tree-mode
  :bind (("C-x u" . undo-tree-undo)
         ("s-z" . undo-tree-undo)
         ("s-r" . undo-tree-redo))
  :init
  (undo-tree-mode t)
  (global-undo-tree-mode t)
  (setq undo-tree-visualizer-relative-timestamps t)
  (setq undo-tree-visualizer-timestamps t)
  (setq undo-tree-auto-save-history t)
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))
  (unless (file-directory-p "~/.emacs.d/undo")
    (make-directory "~/.emacs.d/undo")))

;;; counsel
(use-package counsel
  :diminish counsel
  :commands counsel-mode
  :ensure t
  :bind (("C-c C-r" . ivy-resume)
         ("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-c r" . counsel-rg))
  :init
  (setq counsel-grep-command "rg"))

(use-package ivy
  :commands ivy-mode
  :diminish
  :bind (("C-x b" . ivy-switch-buffer)
         ("C-x B" . ivy-switch-buffer-other-window))
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-display-style 'fancy)
  (ivy-use-virtual-buffers t)
  (enable-recursive-minibuffers t)
  :config
  (ivy-mode 1))

(use-package ivy-rich
  :ensure t
  :after ivy
  :functions ivy-set-display-transformer
  :custom
  (ivy-virtual-abbreviate 'full
                          'ivy-rich-switch-buffer-align-virtual-buffer t
                          'ivy-rich-path-style 'abbrev)
  :config
  (ivy-set-display-transformer 'ivy-switch-buffer
                               'ivy-rich-switch-buffer-transformer))

(use-package ivy-xref
  :after ivy
  :defer t
  :ensure t
  :init
  (setq xref-show-xrefs-function #'ivy-xref-show-xrefs))

;;; swiper
(use-package swiper
  :ensure t
  :after ivy
  :functions jj/swiper-recenter
  :bind (("C-s" . swiper)
         ("C-r" . swiper))
  :init
  ;;advise swiper to recenter on exit
  (defun jj/swiper-recenter ()
    "recenter display after swiper"
    (recenter))
  (advice-add 'swiper :after #'jj/swiper-recenter))

;;; counsel projectile
(use-package counsel-projectile
  :disabled
  :ensure t
  :bind (("C-c p p" . counsel-projectile-switch-project)
         ("C-c p f" . counsel-projectile-find-file)
         ("C-c p d" . counsel-projectile-find-dir))
  :init
  (counsel-projectile-mode))

(use-package counsel-gtags
  :ensure t
  :diminish counsel-gtags-mode
  :bind (("M-." . counsel-gtags-dwim)
         ("M-t" . counsel-gtags-find-definition)
         ("M-r" . counsel-gtags-find-reference)
         ("M-s" . counsel-find-symbols)
         ("M-," . counsel-gtags-go-backward))
  :init
  (add-hook 'c-mode-common-hook 'counsel-gtags-mode)
  (add-hook 'python-mode-hook 'counsel-gtags-mode))

;;; Expand-region
(use-package expand-region
  :ensure t
  :bind ("s-/" . er/expand-region))

;;; whole-line-or-region
(use-package whole-line-or-region
  :ensure t
  :bind (("C-y" . whole-line-or-region-yank)
         ("C-c C-k" . whole-line-or-region-kill-ring-save))
  :diminish whole-line-or-region-local-mode
  :init
  (whole-line-or-region-global-mode t)
  :config
  (unbind-key "C-w" whole-line-or-region-local-mode-map))


;;;; on duplicate filenames, show path names.
(use-package uniquify
  :defer 5
  :init
  (setq uniquify-separator ":")
  (setq uniquify-after-kill-buffer-p t)
  (setq uniquify-buffer-name-style 'post-forward))

;;;; recentf
(use-package recentf
  :commands recentf-mode
  :bind (("C-x C-r" . ido-recentf-open))
  :config
  (recentf-mode t)
  (defun ido-recentf-open ()
    "Use `ido-completing-read' to \\[find-file] a recent file"
    (interactive)
    (if (find-file (ido-completing-read "Find recent file: " recentf-list))
        (message "Opening file...")
      (message "Aborting"))))

(use-package dired
  :commands dired
  :init
  (setq dired-listing-switches "-lahv")
  (setq dired-use-ls-dired nil))

;; load dired extras
(use-package dired-x
  :commands dired-jump
  :bind (("C-x C-j" . dired-jump)))

;;; Doc-view
(use-package doc-view
  :commands doc-view)

(use-package edit-indirect
  :ensure t
  :defer 5)

;;; white space mode
(use-package whitespace
  :commands whitespace-mode
  :init
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  (setq whitespace-line-column 80)
  (setq whitespace-style '(trailing lines space-before-tab indentation space-after-tab)))

(use-package exec-path-from-shell
  :ensure t
  :when (memq window-system '(mac ns))
  :init
  (setq exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-initialize))

(use-package deadgrep
  :ensure t
  :commands deadgrep
  :init
  (defalias 'dg 'deadgrep))

(provide 'utils)
