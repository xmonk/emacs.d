(face-spec-set 'default
               '((((type x)) :family "PragmataPro Mono" :pixelsize 200 :foundry "FSD" :slant normal :weight normal :spacing 100 :height 100 :width normal :scalable t)
                 (((type ns)) :family "PragmataPro Mono" :pixelsize 200 :foundry "FSD" :slant normal :weight normal :spacing 100 :height 135 :width normal :scalable t)
                 (t :family :height 100)))

(setq default-frame-alist '((user-size t)
                            (background "#1d1f21")
                            (foreground "#c5c8c6")))
(setq inhibit-startup-message t)
(setq package-enable-at-startup t)
(setq package-quickstart t)
(package-initialize)
