(setq inhibit-startup-message t)
(setq default-directory (expand-file-name "~/"))

;;; Fonts
(face-spec-set 'default
               '((((type x)) :family "PragmataPro Mono" :pixelsize 100 :foundry "FSD" :slant normal :weight normal :spacing 100 :height 105 :width normal :scalable t)
                 (((type ns)) :family "PragmataPro Mono" :pixelsize 200 :foundry "FSD" :slant normal :weight normal :spacing 100 :height 145 :width normal :scalable t)
                 (t :family :height 100)))

(setq default-frame-alist '((user-size t)
                            (background "#1d1f21")
                            (foreground "#c5c8c6")))


;;; package
(require 'package nil t)
(setq package-archives
      '(("elpa" . "https://elpa.gnu.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ("melpa" . "https://melpa.org/packages/")))

(setq package-enable-at-startup t)
(if (>= emacs-major-version 27)
    (setq package-quickstart t)
  (package-initialize))


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package nil t))
