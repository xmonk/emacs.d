(face-spec-set 'default
               '((((type x)) :family "PragmataPro Mono" :foundry "fsdf" :slant normal :weight normal :height 100 :width normal)
                 (((type ns)) :family "PragmataPro Mono" :foundry "fsdf" :slant normal :weight normal :height 135 :width normal)
                 (t :family :height 130)))

(setq default-frame-alist '((user-size . t)
                            (background . "black")
                            (foreground . "white")
                            (ns-appearance . dark)))
(setq package-enable-at-startup t)
(setq package-quickstart t)
(package-initialize)
