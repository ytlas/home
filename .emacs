(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; Backup toggles
(setq backup-directory-alist
    `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
    `((".*" ,temporary-file-directory t)))

;; Mode toggles
(menu-bar-mode -1)
(require 'evil)
(evil-mode 1)
(ido-mode 1)
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

;; Display column number
(setq column-number-mode t)

;; Prevent welcome screen
(setq inhibit-startup-message t)
