;;; utils.el -*- lexical-binding: t; -*-
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
         ("s-z" . undo-tree-undo))
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
         ("C-x C-f" . counsel-find-file)
         ("C-x C-r" . counsel-recentf)
         ("C-c r" . counsel-minor-history))
  :init
  (unbind-key "C-r" minibuffer-local-map)
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
  :init
  (setq ivy-initial-inputs-alist nil)
  (setq ivy-re-builders-alist
        '((counsel-rg . ivy--regex-plus)
          (counsel-projectile-rg . ivy--regex-plus)
          (counsel-ag . ivy--regex-plus)
          (counsel-projectile-ag . ivy--regex-plus)
          (swiper . ivy--regex-plus)
          (t . ivy--regex-fuzzy)))
  :config
  (ivy-mode 1))

(use-package ivy-posframe
  :disabled
  :ensure t
  :diminish (ivy-posframe-mode . "")
  :init
  (setq ivy-posframe-parameters
        '((left-fringe . 8)
          (right-fringe . 8)))
  (setq ivy-posframe-width 100)
  (setq ivy-posframe-height-alist '((swiper . 10)
                                    (t      . 10)))
  (setq ivy-posframe-display-functions-alist
        '((complete-symbol . ivy-posframe-display-at-point)
          (counsel-M-x     . ivy-posframe-display-at-frame-top-center)
          (t               . ivy-posframe-display-at-frame-top-center)))
  :config
  (ivy-posframe-mode 1))

(use-package avy
  :bind (("C-c ;" . avy-goto-char)
         ("C-c '" . avy-goto-char-2)
         ("C-c l" . avy-goto-line)))

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
  :disabled
  :ensure t
  :requires ivy
  :functions jj/swiper-recenter
  :bind (("C-s" . swiper))
  :init
  ;;advise swiper to recenter on exit
  (defun jj/swiper-recenter ()
    "recenter display after swiper"
    (recenter))
  (advice-add 'swiper :after #'jj/swiper-recenter))

;;; counsel projectile
(use-package counsel-projectile
  :ensure t
  :requires projectile
  :config (counsel-projectile-mode t))

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
  :bind (("M-w" . whole-line-or-region-kill-ring-save))
  :diminish whole-line-or-region-local-mode
  :config
  (dolist (hook '(prog-mode-hook org-mode-hook))
    (add-hook hook #'whole-line-or-region-local-mode)))

(use-package deadgrep
  :ensure t
  :init
  (defalias 'dg 'deadgrep))

(use-package browse-at-remote
  :ensure t
  :bind (("C-c g g" . browse-at-remote)))

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :functions which-key-M-x-prefix+
  :init
  (setq prefix-help-command #'which-key-M-x-prefix+)
  :config
  (which-key-mode))

(provide 'utils)
