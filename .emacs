;; Automatically install required packages
(setq package-list '(evil emms helm magit))

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; Fetch the list of packages available
(unless package-archive-contents
    (package-refresh-contents))

;; Install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Backup toggles
(setq backup-directory-alist
    `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
    `((".*" ,temporary-file-directory t)))

;; Mode toggles
(menu-bar-mode -1)
(require 'evil)
(evil-mode 1)
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

;; Display column number
(setq column-number-mode t)

;; Prevent welcome screen
(setq inhibit-startup-message t)

(require 'emms-setup)
(emms-standard)
(emms-default-players)

;; Helm binds
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
