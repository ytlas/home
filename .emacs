;; Adam's Emacs config, pretty noobish, I know, but it works.
(setq package-list '(async emms expand-region google-translate multi-term popup undo-tree web-mode ido-ubiquitous smex google-translate flycheck magit))
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
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
(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)
(global-flycheck-mode 1)

;; Display column number
(setq column-number-mode t)

;; Prevent welcome screen
(setq inhibit-startup-message t)

;; Multi term bind
(global-set-key (kbd "<f5>") 'multi-term)

;; Emms
(global-set-key (kbd "C-c m") 'emms)
(global-set-key (kbd "C-c d") 'emms-add-directory-tree)

;; eliminate long "yes" or "no" prompts
(fset 'yes-or-no-p 'y-or-n-p)

;; Expand region
(global-set-key (kbd "C-@") 'er/expand-region)

;; Magit
(global-set-key (kbd "C-c c") 'magit-commit)
(global-set-key (kbd "C-c p") 'magit-push)

;; EMMS
(emms-standard)
(emms-default-players)

;; Web-mode autoloads
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(ac-config-default)

;; In case of GUI
(fringe-mode 0)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Smex
(global-set-key (kbd "M-x") 'smex)

;; Ace-jump
(define-key global-map (kbd "C-ö") 'ace-jump-mode)

;; Vim-like-f
(define-key global-map (kbd "M-ö") 'iy-go-to-char)

;; Pair Mode
(electric-pair-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (manoj-dark)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono derivative Powerline" :foundry "unknown" :slant normal :weight normal :height 143 :width normal))))
 '(cursor ((t (:background "white"))))
 '(highlight-current-line-face ((t (:background "gray15"))))
 '(mode-line ((t (:background "white" :foreground "black" :box nil :height 1.0))))
 '(mode-line-buffer-id ((t (:background "white" :foreground "black" :weight normal :height 1.0))))
 '(mode-line-inactive ((t (:background "dim gray" :foreground "black" :box nil :weight normal :height 1.0))))
 '(region ((t (:background "gray40")))))
