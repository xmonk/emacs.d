(defvar jj--file-name-handler-alist file-name-handler-alist)
(defvar jj--gc-cons-threshold gc-cons-threshold)
(defvar jj--gc-cons-precentage gc-cons-percentage)
(setq file-name-handler-alist nil)
(setq gc-cons-threshold most-positive-fixnum)
(setq gc-cons-percentage 0.6)
(setq inhibit-startup-message t)
(setq default-directory (expand-file-name "~/"))


(defun jj-defer-garbage-collection-h ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun jj-restore-garbage-collection-h ()
  ;; Defer it so that commands launched immediately after will enjoy the
  ;; benefits.
  (run-at-time 1 nil (lambda () (setq gc-cons-threshold jj--gc-cons-threshold))))

(add-hook 'minibuffer-setup-hook #'jj-defer-garbage-collection-h)
(add-hook 'minibuffer-exit-hook #'jj-restore-garbage-collection-h)

(add-hook 'emacs-startup-hook (lambda ()
                                ;; restore after startup
                                (setq gc-cons-threshold 16777216)
                                (setq gc-cons-percentage 0.1)
                                (setq file-name-handler-alist jj--file-name-handler-alist)))

(add-hook 'window-setup-hook (lambda ()
                               (when (string= "DRL01834" (system-name))
                                 (setq frame-title-format '(multiple-frames "%b" ("" "%b"))))
                               (when (eql window-system nil)
                                 (menu-bar-mode -1))
                               (toggle-frame-maximized)))
;;; Fonts
(face-spec-set 'default
               '((((type x)) :family "PragmataPro Mono" :pixelsize 100 :foundry "FSD" :slant normal :weight normal :spacing 100 :height 105 :width normal :scalable t)
                 (((type ns)) :family "JuliaMono" :pixelsize 200 :slant normal :weight normal :spacing 100 :height 155 :width normal :scalable t)
                 ;; (((type ns)) :family "Lucida Grande Mono" :pixelsize 200 :foundry "B&H" :slant normal :weight normal :spacing 100 :height 150 :width normal :scalable t)
                 (((type mac)) :family "PragmataPro Mono" :pixelsize 200 :foundry "FSD" :slant normal :weight normal :spacing 100 :height 165 :width normal :scalable t)
                 (t :family :height 100)))

(setq default-frame-alist '((user-size t)
                            (background "#1d1f21")
                            (foreground "#c5c8c6")))
(setq frame-resize-pixelwise t)

;;; package
(require 'package nil t)
(setq package-archives
      '(("elpa" . "https://elpa.gnu.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ("melpa" . "https://melpa.org/packages/")))

(setq package-quickstart t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package nil t))
