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
  (undo-tree-mode t)
  (global-undo-tree-mode t)
  (setq undo-tree-visualizer-relative-timestamps t)
  (setq undo-tree-visualizer-timestamps t))

;;; swiper
(use-package swiper
  :ensure t
  :diminish ivy-mode
  :functions jj/swiper-recenter
  :bind (("C-s" . swiper)
         ("C-r" . swiper))
  :init
  ;;advise swiper to recenter on exit
  (defun jj/swiper-recenter ()
    "recenter display after swiper"
    (recenter))
  (advice-add 'swiper :after #'jj/swiper-recenter))

;;; counsel
(use-package counsel
  :ensure t)

;;; counsel projectile
(use-package counsel-projectile
  :ensure t
  :after counsel
  :init
  (counsel-projectile-mode))

(use-package counsel-gtags
  :ensure t
  :after (counsel ggtags)
  :bind (("M-." . counsel-gtags-dwim))
  :init
  (add-hook 'c-mode-common-hook 'counsel-gtags-mode)
  (add-hook 'python-mode-hook 'counsel-gtags-mode))

;;; ivy
(use-package ivy
  :ensure t
  :init
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  :bind (("C-c C-r" . ivy-resume)
         ("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file))
  :config
  (ivy-mode 1))

;;; flx-ido
(use-package flx-ido
  :disabled
  :commands flx-ido-mode
  :after ido
  :ensure t
  :init
  (flx-ido-mode t))

;;; Expand-region
(use-package expand-region
  :ensure t
  :defer t
  :bind ("s-/" . er/expand-region))

;;; whole-line-or-region
(use-package whole-line-or-region
  :ensure t
  :bind (("C-y" . whole-line-or-region-yank)
         ("M-w" . whole-line-or-region-kill-ring-save))
  :diminish whole-line-or-region-local-mode
  :init
  (whole-line-or-region-global-mode t))

(use-package exec-path-from-shell
  :ensure t
  :when (memq window-system '(mac ns x))
  :init
  (setq exec-path-from-shell-check-startup-files nil))

(use-package deadgrep
  :ensure t
  :init
  (defalias 'dg 'deadgrep))

(provide 'utils)
