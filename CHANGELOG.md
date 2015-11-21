### Fix issue with url-insert-buffer-content (HEAD -> master, origin/master, origin/HEAD)
>Fri, 20 Nov 2015 22:45:27 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)

The function url-insert-buffer-content is expected to be bound, but as
it's not autoloaded package.el doesn't update or connects. This code
make sure that if it's not bound the librar url-handlers is loaded
for the function to be bound.



### Enable custom theme.
>Sun, 8 Nov 2015 19:49:00 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Add box to inactive modeline.
>Sun, 8 Nov 2015 19:48:32 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Fix formatting and add doc strings.
>Sun, 8 Nov 2015 19:47:50 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Set region to a sane color.
>Sun, 8 Nov 2015 10:08:50 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Fix save-place.
>Tue, 3 Nov 2015 12:28:54 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Updated to use use-package for save-place
>Sat, 31 Oct 2015 21:51:46 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Refactored (jj/print-date) into (jj/insert-date) (jj/insert-datetime)
>Sat, 31 Oct 2015 13:37:03 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### New packages
>Thu, 29 Oct 2015 16:47:33 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Add orgmode elpa
>Thu, 29 Oct 2015 16:47:20 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Fix a few issues, changed foreground color.
>Tue, 27 Oct 2015 16:24:08 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Add go-rename package.
>Tue, 27 Oct 2015 15:30:21 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Fix typo.
>Tue, 27 Oct 2015 15:30:05 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### More formatting.
>Tue, 27 Oct 2015 15:29:49 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Add comment to enable a dark theme.
>Tue, 27 Oct 2015 15:29:20 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Formatting.
>Tue, 27 Oct 2015 15:27:59 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Use go-rename melpa package.
>Tue, 27 Oct 2015 15:26:16 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Reverting to default modeline.
>Sat, 24 Oct 2015 18:51:32 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Experimenting with fonts.
>Sat, 24 Oct 2015 18:48:13 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Update packag-selected-packages.
>Sat, 24 Oct 2015 18:47:09 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Disabled helm
>Sat, 24 Oct 2015 18:42:06 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Change keybinding for eshell
>Sat, 24 Oct 2015 18:41:46 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Fix issue with utop config not loading.
>Sat, 24 Oct 2015 18:41:23 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### set cursor color
>Fri, 23 Oct 2015 18:16:59 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Update header.
>Thu, 22 Oct 2015 18:55:43 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Add file header.
>Thu, 22 Oct 2015 18:55:25 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Disable use-package verbose
>Thu, 22 Oct 2015 17:07:00 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Trying a dark background for a change.
>Thu, 22 Oct 2015 17:06:41 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Ensure packages are installed.
>Thu, 22 Oct 2015 17:06:07 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Refactored codesearch function into a macro.
>Thu, 22 Oct 2015 17:04:23 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)

By using a macro instead of several functions, I can create different
functions using different index files, making search even more useful.



### removed semantic
>Wed, 21 Oct 2015 18:01:36 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### rempped swiper keys
>Wed, 21 Oct 2015 18:01:25 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### enable semantic
>Wed, 21 Oct 2015 17:35:23 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Add new items to gitignore.
>Tue, 20 Oct 2015 08:29:56 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Enable ocaml setup.
>Tue, 20 Oct 2015 08:26:54 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Add new packages.
>Tue, 20 Oct 2015 08:26:26 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Cleaned up helm configuration.
>Tue, 20 Oct 2015 08:25:39 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Update swiper configuration.
>Tue, 20 Oct 2015 08:25:10 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Defer loading whole-line-or-region-mode
>Tue, 20 Oct 2015 08:24:50 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Defer load projectile.
>Tue, 20 Oct 2015 08:24:33 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Remove Avy, defer load hydra.
>Tue, 20 Oct 2015 08:23:25 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Enabled smex
>Tue, 20 Oct 2015 08:22:55 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Add keymap for hydra-window
>Sat, 17 Oct 2015 22:12:26 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Customized hydra-window more to my liking.
>Sat, 17 Oct 2015 22:12:09 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Trying out hydra,and avy
>Sat, 17 Oct 2015 21:43:17 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Cleanup
>Sat, 17 Oct 2015 21:41:39 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Fixed keymaps add helm-swoop
>Sat, 17 Oct 2015 21:41:09 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Fix typos
>Mon, 5 Oct 2015 20:15:45 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Installed several packages via use-package
>Mon, 5 Oct 2015 20:14:53 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Add new packages
>Mon, 5 Oct 2015 20:14:32 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Remove paredit-ext
>Mon, 5 Oct 2015 20:14:03 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Add new keybindings and reconfigure several options
>Mon, 5 Oct 2015 20:02:45 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Moved several autoload and require to use-package
>Mon, 5 Oct 2015 20:02:02 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Use use-package to load custom modules.
>Mon, 5 Oct 2015 20:00:41 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Enabled company-jedi
>Fri, 2 Oct 2015 13:29:56 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Enabled helm and company-jedi
>Fri, 2 Oct 2015 13:29:06 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Use (subword) in Go and Python.
>Fri, 2 Oct 2015 13:28:04 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Modified to use use-package instead of require.
>Wed, 30 Sep 2015 22:15:20 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Move initialization code from global.el to init.el
>Wed, 30 Sep 2015 22:13:54 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Removed unused packages
>Wed, 2 Sep 2015 10:24:21 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Add some useful bindings for python
>Tue, 1 Sep 2015 20:22:53 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Set tramp to use ssh as default method.
>Tue, 1 Sep 2015 20:22:28 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Add key bindings.
>Tue, 1 Sep 2015 12:31:24 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Change face attributes and module loading.
>Tue, 1 Sep 2015 12:30:56 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Use https to access package archives.
>Tue, 1 Sep 2015 12:27:56 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### No need for the guard.
>Tue, 25 Aug 2015 22:33:18 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Add new modes.
>Tue, 25 Aug 2015 22:32:50 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Enabled tuareg and company-mode.
>Tue, 25 Aug 2015 22:32:32 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### add keymap for hexl-find-file
>Mon, 24 Aug 2015 17:54:17 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Setup paredit
>Mon, 24 Aug 2015 17:54:01 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### setup company mode
>Mon, 24 Aug 2015 17:53:36 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### update company mode faces
>Mon, 24 Aug 2015 17:52:21 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Disabled tuareg mode and it's auxiliary tools.
>Fri, 21 Aug 2015 10:43:11 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Add mappings for undo-tree-undo
>Fri, 21 Aug 2015 10:41:12 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Removed ggtags
>Fri, 21 Aug 2015 10:41:00 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Disabled smex
>Fri, 21 Aug 2015 10:40:41 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Configured eshell
>Fri, 21 Aug 2015 10:39:47 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Set default faces.
>Fri, 21 Aug 2015 10:38:49 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Made colors more consistent.
>Fri, 21 Aug 2015 10:38:28 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Moved from auto-complete to company-mode.
>Fri, 21 Aug 2015 10:28:15 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Reorganization.
>Fri, 21 Aug 2015 10:22:04 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)

Moved face setup from global.el to init.el.
Cleanup and reorganized init.el



### Add dark version of my personal theme.
>Fri, 21 Aug 2015 10:20:34 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Tweaked for legibility.
>Mon, 10 Aug 2015 09:00:44 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Let use-package load my personal theme
>Mon, 10 Aug 2015 08:59:14 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### No longer applies.
>Sun, 9 Aug 2015 10:12:14 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Moved server initialization
>Sun, 9 Aug 2015 10:11:29 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)

Moved server initialization to init.el



### disabled helm
>Fri, 17 Jul 2015 18:04:51 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### add wisent java
>Fri, 17 Jul 2015 18:04:30 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Add wisent python configuration.
>Fri, 17 Jul 2015 18:00:50 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)

Reviewed at http://r.xmonk.org/r/5/



### Removed flx-ido and it's dependencies
>Thu, 16 Jul 2015 18:33:51 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)

Reviewed at http://r.xmonk.org/r/3/



### removed helm configuration.
>Thu, 16 Jul 2015 18:12:13 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Install go-autocomplete automatically.
>Tue, 14 Jul 2015 10:11:10 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Install auto-complete automatically
>Tue, 14 Jul 2015 10:10:52 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Clean up.
>Tue, 14 Jul 2015 10:10:06 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)

Cleaned up the code, removed duplicate entries, and deprecated functions.



### Remove modes ggtags doesn't support.
>Tue, 7 Jul 2015 21:06:18 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Configure markdown to use peg-markdown
>Tue, 7 Jul 2015 21:05:55 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Moved face configuration.
>Tue, 7 Jul 2015 21:05:17 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)

Moved face configuration to jj-theme.el to avoid clutter.



### Remove linum face configuration.
>Tue, 7 Jul 2015 21:01:50 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Format code properly.
>Tue, 7 Jul 2015 21:00:48 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Use path-separator for compatibility with other OS.
>Tue, 7 Jul 2015 21:00:04 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Change font
>Sun, 5 Jul 2015 11:34:16 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Start projectile on init
>Sun, 5 Jul 2015 11:30:22 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Load frame and theme
>Sun, 5 Jul 2015 11:30:09 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Add ggtags
>Sun, 5 Jul 2015 11:29:55 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Add java configuration to load on init.
>Sun, 5 Jul 2015 11:28:39 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Add more commands to start helm when required.
>Sun, 5 Jul 2015 11:28:17 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Add java config and personal theme
>Sun, 5 Jul 2015 11:25:49 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Remove use of interactive in non interactive use
>Sun, 5 Jul 2015 11:23:10 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)

(goto-line) is recommended only for interactive use. Changed to (forward-line).



### Added auto-complete, helm and projectile
>Sat, 4 Jul 2015 11:46:30 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Add new emacs modules.
>Fri, 3 Jul 2015 12:08:36 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Remove deprecated function call.
>Fri, 3 Jul 2015 12:08:21 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Add auto completion.
>Fri, 3 Jul 2015 12:08:04 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Fix issue with menu-bar
>Fri, 3 Jul 2015 12:07:16 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)

Menu-bar was appearing in the console because of a code bug.



### Add auto-complete config.
>Fri, 3 Jul 2015 12:07:01 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Add swiper fix issue with save-place.
>Fri, 3 Jul 2015 12:06:27 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Add projectile configuration.
>Fri, 3 Jul 2015 12:06:02 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Reformat code
>Fri, 3 Jul 2015 12:05:07 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Add utility function
>Thu, 25 Jun 2015 11:38:52 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Move frame maximize function.
>Thu, 25 Jun 2015 11:38:31 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### add code to maximize frame.
>Thu, 25 Jun 2015 11:35:23 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Disable font lock.
>Thu, 25 Jun 2015 11:32:15 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Fix defun formatting.
>Mon, 27 Apr 2015 07:22:11 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Set ibuffer to be the default for list-buffers.
>Wed, 22 Apr 2015 12:45:54 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Add helper functions for porjectile not tested.
>Tue, 21 Apr 2015 19:19:27 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Add code to codesearch from a specific index.
>Tue, 21 Apr 2015 19:19:01 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Reformat code to conform to elisp style.
>Tue, 21 Apr 2015 19:16:38 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Set frame geometry on session start.
>Tue, 21 Apr 2015 19:13:28 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Documentation changes.
>Sun, 19 Apr 2015 10:02:42 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Disable flyspell on go-mode buffers.
>Sun, 19 Apr 2015 10:02:18 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Various changes detailed below.
>Sun, 19 Apr 2015 10:01:09 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)

Add file header
Add more faces configuration.
Reorganized the code as well as it's documentation.



### Various changes outlined below.
>Sun, 19 Apr 2015 09:56:42 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)

Add defadvice for (ffap-file-at-point)
Add defadvice for (find-file)
Add defadvice for (server-visit-file)

The previous changes help emacs understand the format:
`filename:linenumber:position`

Removed several helper functions that are no longer needed.
Reformat comments and documentation.



### add headers
>Sun, 19 Apr 2015 09:55:41 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### add header package
>Sun, 19 Apr 2015 09:53:01 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### add header and documentation
>Sun, 19 Apr 2015 09:52:41 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### add smex-items
>Sun, 19 Apr 2015 09:52:18 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### tweaked configuration
>Thu, 16 Apr 2015 23:00:50 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### move provide to standard place
>Thu, 16 Apr 2015 23:00:22 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### new packages
>Thu, 16 Apr 2015 22:58:20 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### add code to disable {menu,tool,scroll}-bar-mode
>Thu, 16 Apr 2015 22:58:07 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Fix issue disabling magit warning.
>Sun, 12 Apr 2015 12:11:03 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Add smartscan package
>Sun, 12 Apr 2015 12:09:50 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Restructured the code for readability.
>Sat, 11 Apr 2015 20:56:22 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Add (delete-selection-mode), Remove (which-function-mode)
>Sat, 11 Apr 2015 11:18:34 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Simplify and cleanup configuration.
>Sat, 11 Apr 2015 11:13:49 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Restructure file, removed unused settings.
>Sat, 11 Apr 2015 11:13:01 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Remove uneeded settings.
>Sat, 11 Apr 2015 11:12:27 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Remove exec-path-from-shell package.
>Sat, 11 Apr 2015 10:38:44 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Add a few more files to ignore.
>Sat, 11 Apr 2015 10:35:57 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Add readme
>Sat, 11 Apr 2015 10:35:47 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Had to re-organized the file due to changes in emacs25
>Sat, 11 Apr 2015 10:32:20 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Setup the frame first to avoid flickering.
>Sat, 11 Apr 2015 10:28:41 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Use plain python interpreter.
>Sat, 11 Apr 2015 10:27:49 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Set the GOPATH environment.
>Sat, 11 Apr 2015 10:27:38 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Add lisp and emacs-lisp basic configuration.
>Sat, 11 Apr 2015 10:26:32 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Set a few magit config options.
>Sat, 11 Apr 2015 09:52:08 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Cleanup and formatting.
>Sat, 11 Apr 2015 09:47:52 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### When running emacsclient -t disable menu-mode.
>Sat, 11 Apr 2015 09:47:17 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Remove duplicate package-refresh command.
>Sat, 11 Apr 2015 09:45:31 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### Initial import of new slimmer config.
>Fri, 10 Apr 2015 16:34:12 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




### project ignore file.
>Fri, 10 Apr 2015 16:33:57 -0400

>Author: Juan Fuentes (jj@xmonk.org)

>Commiter: Juan Fuentes (jj@xmonk.org)




