;;; diminish
(use-package diminish
  :commands diminish
  :ensure t)

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

(use-package git-timemachine
  :ensure t
  :commands git-timemachine)

;;; undo-tree
(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :bind (("C-x u" . undo-tree-undo)
         ("s-z" . undo-tree-undo)
         ("s-r" . undo-tree-redo))
  :init
  (setq undo-tree-visualizer-relative-timestamps t)
  (setq undo-tree-visualizer-timestamps t)
  (setq undo-tree-auto-save-history t)
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))
  (unless (file-directory-p (concat user-emacs-directory "undo"))
    (make-directory (concat user-emacs-directory "undo")))
  :config
  (undo-tree-mode t)
  (global-undo-tree-mode t))

;;; projectile
(use-package projectile
  :ensure t
  :commands (projectile-mode projectile-switch-project)
  :diminish projectile-mode
  :functions projectile-relevant-known-projects
  :defines projectile-mode-line
  :bind (:map projectile-mode-map ("C-c p" . projectile-command-map))
  :init
  (setq projectile-completion-system 'ivy)
  (setq projectile-mode-line "Projectile")
  (projectile-mode t))

;;; counsel
(use-package counsel
  :requires ivy
  :ensure t
  :diminish
  :bind (("C-c C-r" . ivy-resume)
         ("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-x C-r" . counsel-recentf)
         ("C-c r" . counsel-rg))
  :init
  (setq counsel-grep-command "rg"))

(use-package ivy
  :commands (ivy-mode ivy-switch-buffer ivy-switch-buffer-other-window)
  :diminish
  :functions ivy-mode
  :bind (("C-x b" . ivy-switch-buffer)
         ("C-x B" . ivy-switch-buffer-other-window))
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-display-style 'fancy)
  (ivy-use-virtual-buffers t)
  (enable-recursive-minibuffers t)
  :config
  (ivy-mode 1))

(use-package avy
  :bind (("C-c ;" . avy-goto-char)
         ("C-c '" . avy-goto-char-2)
         ("C-c g" . avy-goto-line)))

(use-package ivy-rich
  :ensure t
  :requires ivy
  :functions ivy-set-display-transformer
  :custom
  (ivy-virtual-abbreviate 'full
                          'ivy-rich-switch-buffer-align-virtual-buffer t
                          'ivy-rich-path-style 'abbrev))

(use-package ivy-xref
  :disabled
  :ensure t
  :requires ivy
  :defer
  :init
  (setq xref-show-xrefs-function #'ivy-xref-show-xrefs))

;;; swiper
(use-package swiper
  :ensure t
  :requires ivy
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
  :requires projectile)

(use-package counsel-gtags
  :ensure t
  :diminish counsel-gtags-mode
  :bind (("M-t" . counsel-gtags-find-definition)
         ("M-r" . counsel-gtags-find-reference)
         ("M-s" . counsel-gtags-find-symbol)
         ("M-," . counsel-gtags-go-backward)
         ("M-." . counsel-gtags-dwim))
  :init
  (add-hook 'c-mode-common-hook 'counsel-gtags-mode)
  (add-hook 'python-mode-hook 'counsel-gtags-mode))

;;; flx-ido
(use-package flx-ido
  :disabled
  :commands flx-ido-mode
  :requires ido
  :ensure t
  :config
  (flx-ido-mode t))

;;; Expand-region
(use-package expand-region
  :ensure t
  :defer t
  :bind ("s-/" . er/expand-region))

;;; whole-line-or-region
(use-package whole-line-or-region
  :ensure t
  :defer
  :bind (("C-y" . whole-line-or-region-yank)
         ("M-w" . whole-line-or-region-kill-ring-save))
  :diminish whole-line-or-region-local-mode
  :config
  (dolist (hook '(prog-mode-hook org-mode-hook))
    (add-hook hook #'whole-line-or-region-local-mode)))

(use-package exec-path-from-shell
  :disabled
  :when (memq window-system '(mac ns x))
  :init
  (setq exec-path-from-shell-check-startup-files nil))

(use-package deadgrep
  :ensure t
  :pin melpa-stable
  :init
  (defalias 'dg 'deadgrep))

(provide 'utils)
