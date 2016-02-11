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

(defun c-insert-include()
  (interactive)
  (insert "#include <.h>")
  (backward-char 3))

(defun c-insert-local-include()
  (interactive)
  (insert "#include \".h\"")
  (backward-char 3))

(defun jj-c-hook()
  (semantic-mode t)
  (global-semanticdb-minor-mode 1)
  (global-semantic-idle-scheduler-mode 1)
  (semantic-default-c-setup)
  (semantic-add-system-include "/usr/include")
  (semantic-add-system-include "/usr/local/include")
  (c-set-style "linux")
  (setq-default tab-width '8)
  (setq-default indent-tabs-mode t)
  (setq fill-column 80)
  (setq comment-column 72)
  (setq-default turn-on-auto-fill t)
  (setq-default c-electric-pound-behavior (quote(alignleft)))
  (load-after company
    (add-to-list 'company-backends '(company-clang)))
  (define-key c-mode-base-map (kbd "C-c i") 'c-insert-include)
  (define-key c-mode-base-map (kbd "C-c I") 'c-insert-local-include)
  (define-key c-mode-base-map (kbd "C-c C-c") 'compile)
  (define-key c-mode-base-map (kbd "C-c f") 'ff-find-other-file)
  (define-key c-mode-base-map (kbd "C-TAB") 'semantic-ia-complete-symbol)
  (set (make-local-variable 'compile-command)
       (concat "gcc -g -fsanitize=address " (buffer-file-name)
	       " -o " (file-name-sans-extension buffer-file-name))))

(add-hook 'c-mode-common-hook 'jj-c-hook)
(add-hook 'c++mode-common-hook 'jj-c-hook)

(provide 'c-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; c-conf.el ends here
