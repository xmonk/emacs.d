(face-spec-set 'default
               '((((type x)) :family "PragmataPro Mono Liga" :foundry "fsdf" :slant normal :weight normal :height 100 :width normal)
                 (((type ns)) :family "PragmataPro Mono Liga" :foundry "fsdf" :slant normal :weight normal :height 135 :width normal)
                 (t :family :height 100)))

(setq default-frame-alist '((user-size t)
                            (background . "black")
                            (foreground . "white")))
(setq inhibit-startup-message t)
(setq package-enable-at-startup t)
(setq package-quickstart t)
(package-initialize)
