;;; c-conf.el ---  C configuration file  -*- lexical-binding: t; -*-
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
  :custom
  (gdb-many-windows t)
  (gdb-show-main t)
  :init
  (add-hook 'c-mode-common-hook #'flycheck-mode)
  (add-hook 'c-mode-common-hook 'jj/c-hook)
  (defun jj/c-hook ()
    ;; set style to "linux"
    (c-set-style "linux")
    ;; use gdb-many-windows by default
    (setq-local tab-width '8)
    (setq-local indent-tabs-mode t)
    (setq fill-column 80)
    (setq comment-style 'extra-line)
    (setq comment-column 72)
    (turn-on-auto-fill)
    (setq-local c-electric-pound-behavior (quote(alignleft))))
  :config
  (bind-key "C-c C-c" 'compile c-mode-base-map)
  (bind-key "C-c i" 'c-insert-include c-mode-base-map)
  (bind-key "C-c I" 'c-insert-local-include c-mode-base-map)
  (bind-key "C-c f" 'ff-find-other-file c-mode-base-map)
  (bind-key "C-c C-j" 'semantic-ia-fast-jump c-mode-base-map)
  (bind-key "C-c C-s" 'semantic-ia-show-summary c-mode-base-map)

  (use-package clang-format
    :ensure t
    :after cc-mode
    :custom
    (clang-format-style
     "{BasedOnStyle: llvm, UseTab: Always, IndentWidth: 8, AllowShortFunctionsOnASingleLine: None, KeepEmptyLinesAtTheStartOfBlocks: false}")
    :commands (clang-format clang-format-buffer clang-format-region)
    :init
    (if (eq system-type 'darwin)
        (setq clang-format-executable "/usr/local/opt/llvm/bin/clang-format")
      (setq clang-format-executable "clang-format-5.0")))

  (defun c-insert-include()
    (interactive)
    (insert "#include <>")
    (backward-char 1))

  (defun c-insert-local-include()
    (interactive)
    (insert "#include \"\"")
    (backward-char 1))

  (use-package semantic
    :disabled
    :functions (semantic-add-system-include)
    :config
    (semantic-mode t)
    (semantic-add-system-include "/usr/include")
    (semantic-add-system-include "/usr/local/include")
    (require 'semantic/sb)
    (require 'semantic/ia)
    (use-package semantic/idle :after cc-mode))

  (use-package irony
    ;; To compile irony-server in macOS: cmake -DCMAKE_CXX_COMPILER=/usr/local/opt/llvm/bin/clang++
    ;; -DCMAKE_PREFIX_PATH=/usr/local/opt/llvm -DCMAKE_INSTALL_RPATH=/usr/local/opt/llvm
    ;; -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=TRUE -DCMAKE_INSTALL_PREFIX=/Users/jj/.emacs.d/var/irony/
    ;; /Users/jj/.emacs.d/elpa/irony-20170627.1045/server && cmake --build . --use-stderr --config
    ;; Release --target install
    :ensure t
    :init
    (add-hook 'c-mode-hook 'irony-mode)
    (add-hook 'c++-mode-hook 'irony-mode)
    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
    :config
    (use-package irony-eldoc
      :ensure t
      :init
      (add-hook 'irony-mode-hook #'irony-eldoc))

    (use-package company-irony-c-headers
      :ensure t
      :requires company-irony
      :init
      (add-to-list 'company-backends 'company-irony-c-headers))

    (use-package company-irony
      :ensure t
      :requires company-mode
      :init
      (add-to-list 'company-backends '(company-irony company-clang)))))


(provide 'c-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; c-conf.el ends here
