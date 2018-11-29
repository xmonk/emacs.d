(face-spec-set 'default
               '((((type x)) :family "PragmataPro Mono" :pixelsize 10 :foundry "FSD" :slant normal :weight normal :spacing 100 :height 100 :width normal :scalable t)
                 (((type ns)) :family "PragmataPro Mono" :pixelsize 10 :foundry "FSD" :slant normal :weight normal :spacing 100 :height 135 :width normal :scalable t)
                 (t :family :height 100)))

(setq default-frame-alist '((user-size . t)
                            (background . "black")
                            (foreground . "white")))
(setq package-enable-at-startup t)
(setq package-quickstart t)
(cd "~/")
(package-initialize)
