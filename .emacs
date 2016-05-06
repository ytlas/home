;; Adam's Emacs config, pretty noobish, I know, but it works.
(setq package-list '(async emms expand-region google-translate multi-term popup undo-tree web-mode ido-ubiquitous smex google-translate flycheck magit auto-complete ace-jump-mode iy-go-to-char))
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
(ac-config-default)
(blink-cursor-mode 0)

;; General keybinds
(global-set-key (kbd "C-n") 'next-logical-line)
(global-set-key (kbd "C-p") 'previous-logical-line)
(global-set-key (kbd "<f5>") 'multi-term)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c d") 'emms-add-directory-tree)
(global-set-key (kbd "C-c m") 'emms)
(global-set-key (kbd "C-c p") 'magit-push)
(global-set-key (kbd "C-c c") 'magit-commit)
(global-set-key (kbd "C-@") 'er/expand-region)
(define-key global-map (kbd "C-ö") 'ace-jump-mode)
(define-key global-map (kbd "M-m") 'iy-go-up-to-char)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c C-/") 'mc/mark-sgml-tag-pair)
(defun my/mm()
	       (interactive)
	       (message "%s" major-mode)
	       )
			    
;; Hooks
(add-hook 'emacs-lisp-mode-hook 'hl-line-mode)
(add-hook 'web-mode-hook 'hl-line-mode)

;; Mode-line config
;;(setq mode-line-format (list "<%*%b>\t<%l:%c\t%p>  \t<%m>"))
(setq-default mode-line-format (list "<%*%b>\t<%l:%c\t%p>  \t<%m>"))

;; Prevent welcome screen
(setq inhibit-startup-message t)

;; eliminate long "yes" or "no" prompts
(fset 'yes-or-no-p 'y-or-n-p)

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

;; In case of GUI
(fringe-mode 0)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Pair Mode
(electric-pair-mode 1)

;; FG and BG colors
(add-to-list 'default-frame-alist '(foreground-color . "#ffffff"))
(add-to-list 'default-frame-alist '(background-color . "#000000"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "fixed" :foundry "misc" :slant normal :weight normal :height 156 :width normal))))
 '(cursor ((t (:background "orange"))))
 '(hl-line ((t (:inherit nil :background "gray20"))))
 '(mode-line ((t (:background "white" :foreground "black" :box nil))))
 '(mode-line-inactive ((t (:inherit mode-line :background "light gray" :foreground "black" :box nil :weight light))))
 '(region ((t (:background "chocolate")))))
