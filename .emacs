(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(require 'evil)
(evil-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(blink-cursor-mode 0)

(setq make-backup-files nil)
