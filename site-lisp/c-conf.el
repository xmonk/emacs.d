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
  :init
  (add-hook 'c-mode-common-hook 'jj-c-hook)
  (add-hook 'c-mode-common-hook #'flycheck-mode)
  (add-hook 'c++mode-common-hook 'jj-c-hook)
  (add-hook 'c++mode-common-hook #'flycheck-mode)
  :config
  ;; set style to "linux"
  (setq c-default-style "linux")
  ;; use gdb-many-windows by default
  (setq gdb-many-windows t
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
    (insert "#include <.h>")
    (backward-char 3))

  (defun c-insert-local-include()
    (interactive)
    (insert "#include \".h\"")
    (backward-char 3))

  (use-package semantic
    :config
    (global-semanticdb-minor-mode 1)
    (global-semantic-idle-scheduler-mode 1)
    (semantic-mode 1)
    (semantic-add-system-include "/usr/include")
    (semantic-add-system-include "/usr/local/include"))

  (use-package ede
  :config
  ;; Enable EDE only in C/C++
  (global-ede-mode))

  (use-package ggtags
    :disabled
    :ensure t
    :init
    (add-hook 'c-mode-common-hook
	      (lambda ()
		(when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
		  (ggtags-mode 1))))
    :config
    (ggtags-mode 1)

    (dolist (map (list ggtags-mode-map))
      (define-key map (kbd "C-c g s") 'ggtags-find-other-symbol)
      (define-key map (kbd "C-c g h") 'ggtags-view-tag-history)
      (define-key map (kbd "C-c g r") 'ggtags-find-reference)
      (define-key map (kbd "C-c g f") 'ggtags-find-file)
      (define-key map (kbd "C-c g c") 'ggtags-create-tags)
      (define-key map (kbd "C-c g u") 'ggtags-update-tags)
      (define-key map (kbd "M-.")     'ggtags-find-tag-dwim)
      (define-key map (kbd "M-,")     'pop-tag-mark)
      (define-key map (kbd "C-c <")   'ggtags-prev-mark)
      (define-key map (kbd "C-c >")   'ggtags-next-mark)))

  ;; company-c-headers
  (use-package company-c-headers
    :disabled
    :ensure t
    :init
    (add-to-list 'company-backends 'company-c-headers))

  (defun jj-c-hook()
    (load-after company
      (add-to-list 'company-backends '(company-clang))
      (define-key c-mode-map  (kbd "C-c TAB") 'company-complete)
      (define-key c++-mode-map  (kbd "C-c TAB") 'company-complete))

    (define-key c-mode-base-map (kbd "C-c i") 'c-insert-include)
    (define-key c-mode-base-map (kbd "C-c I") 'c-insert-local-include)
    (define-key c-mode-base-map (kbd "C-c C-c") 'compile)
    (define-key c-mode-base-map (kbd "C-c f") 'ff-find-other-file)
    (define-key c-mode-base-map (kbd "C-c C-j") 'semantic-ia-fast-jump)
    (define-key c-mode-base-map (kbd "C-c C-s") 'semantic-ia-show-summary)

    (set (make-local-variable 'compile-command)
	 (concat "gcc -g -fsanitize=address " (buffer-file-name)
		 " -o " (file-name-sans-extension buffer-file-name)))))


(provide 'c-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; c-conf.el ends here
