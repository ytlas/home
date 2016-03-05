; Package init
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; Evil mode
(require 'evil)
(evil-mode 1)

;; Some mode toggles
(tool-bar-mode -1)
(menu-bar-mode -1)
(blink-cursor-mode 0)
(fringe-mode 0)
(scroll-bar-mode -1)
(setq inhibit-startup-message t)

(setq make-backup-files nil)

(ido-mode t)
(global-set-key (kbd "C-h") 'previous-buffer)
(global-set-key (kbd "C-l") 'next-buffer)
(global-set-key (kbd "C-f") 'ido-find-file)
