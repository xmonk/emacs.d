;;; c-conf.el ---  C configuration file
;;
;; Filename: c-conf.el
;; Description:
;; Author: Juan Fuentes
;; Maintainer:
;; Created: Sat Apr 18 14:05:39 2015 (-0400)
;; Version:
;; Package-Requires: ()
;; Last-Updated: Sat Apr 18 14:07:54 2015 (-0400)
;;           By:
;;     Update #: 3
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


(use-package cc-mode
  :commands (c-mode c++mode)
  :bind (
	 :map c-mode-base-map
	 ("C-c C-c" . compile)
	 ("C-c i" . c-insert-include)
	 ("C-c I" . c-insert-local-include)
	 ("C-c f" . ff-find-other-file)
	 ("C-c C-j" . semantic-ia-fast-jump)
	 ("C-c C-s" . semantic-ia-show-summary))
  :init
  (add-hook 'c-mode-common-hook #'flycheck-mode)
  (add-hook 'c++mode-common-hook #'flycheck-mode)
  :config

  ;; set style to "linux"
  (setq c-default-style "linux")

  ;; use gdb-many-windows by default
  (setq-default gdb-many-windows t
		gdb-show-main t)

  (setq-default tab-width '8)
  (setq-default indent-tabs-mode t)
  (setq fill-column 80)
  (setq comment-style 'extra-line)
  (setq comment-column 72)
  (setq-default turn-on-auto-fill t)
  (setq-default c-electric-pound-behavior (quote(alignleft)))


  (defun c-insert-include()
    (interactive)
    (insert "#include <>")
    (backward-char 1))

  (defun c-insert-local-include()
    (interactive)
    (insert "#include \"\"")
    (backward-char 1))

  (use-package semantic/db-mode :after cc-mode)
  (use-package semantic/idle :after cc-mode)

  (use-package semantic
    :functions (global-semanticdb-minor-mode global-semantic-idle-scheduler-mode semantic-add-system-include)
    :init
	(semantic-mode 1)
    (global-semanticdb-minor-mode 1)
    (global-semantic-idle-scheduler-mode 1)
    :config
    (semantic-add-system-include "/usr/include")
    (semantic-add-system-include "/usr/local/include"))


  (use-package irony
    ;; To compile irony-server in macOS: cmake -DCMAKE_CXX_COMPILER=/usr/local/opt/llvm/bin/clang++
    ;; -DCMAKE_PREFIX_PATH=/usr/local/opt/llvm -DCMAKE_INSTALL_RPATH=/usr/local/opt/llvm
    ;; -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=TRUE -DCMAKE_INSTALL_PREFIX=/Users/jj/.emacs.d/var/irony/
    ;; /Users/jj/.emacs.d/elpa/irony-20170627.1045/server && cmake --build . --use-stderr --config
    ;; Release --target install
    :ensure t
    :after (c-mode c++-mode)
    :init
    (add-hook 'c-mode-common-hook 'irony-mode)
    (add-hook 'c++mode-common-hook 'irony-mode)
    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
    :config
    (use-package irony-eldoc
      :ensure t
      :init
      (add-hook 'irony-mode-hook #'irony-eldoc))

    (use-package company-irony-c-headers
      :ensure t
      :after company-irony)

    (use-package company-irony
      :ensure t
      :after company-mode
      :init
      (add-to-list 'company-backends '(company-irony-c-headers company-irony company-clang)))))


(provide 'c-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; c-conf.el ends here
