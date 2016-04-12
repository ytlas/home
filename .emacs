;; Automatically install required packages
(setq package-list '(evil emms helm multi-term web-mode symon))

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
(symon-mode)

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

;; Multi term bind
(global-set-key (kbd "<f5>") 'multi-term)

;; Powerline
(require 'powerline)
(powerline-evil-vim-color-theme)

;; HTML indentation
(setq sgml-basic-offset 4)
(add-hook 'html-mode-hook
	  (lambda ()
	    ;; Default indentation is usually 2 spaces, changing to 4.
	        (set (make-local-variable 'sgml-basic-offset) 4)))
