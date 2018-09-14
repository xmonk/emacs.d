(add-to-list 'default-frame-alist '(ns-appearance . dark))
(face-spec-set 'default
               '((((type x)) :family "PragmataPro Mono" :foundry "fsdf" :slant normal :weight normal :height 135 :width normal)
                 (((type ns)) :family "PragmataPro Mono" :foundry "fsdf" :slant normal :weight normal :height 135 :width normal)
                 (t :family :height 140)))
(setq package-enable-at-startup t)
(setq package-quickstart t)
(package-initialize)
