;; Adam's Emacs config, pretty noobish, I know, but it works.
(setq package-list '(async emms expand-region google-translate multi-term popup undo-tree web-mode ido-ubiquitous smex google-translate flycheck magit auto-complete ace-jump-mode iy-go-to-char multiple-cursors))
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
(tooltip-mode nil)
(transient-mark-mode 0)
(show-paren-mode 1)
(setq show-help-function nil)

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
(global-set-key (kbd "C-ö") 'ace-jump-mode)
(global-set-key (kbd "M-m") 'iy-go-up-to-char)
(global-set-key (kbd "M-C-m") 'iy-go-to-char-backward)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c C-/") 'mc/mark-sgml-tag-pair)
(defun my/scroll-down()
  (interactive)
  (scroll-up)
  (recenter))
(defun my/scroll-up()
  (interactive)
  (scroll-down)
  (recenter))
(global-set-key (kbd "C-v") 'my/scroll-down)
(global-set-key (kbd "M-v") 'my/scroll-up)
;; Print major-mode-string with function
(defun my/mm()
	       (interactive)
	       (message "%s" major-mode)
	       )
			    
;; Hooks
(add-hook 'emacs-lisp-mode-hook 'hl-line-mode)
(add-hook 'web-mode-hook 'hl-line-mode)
(defun my/term-hook()
  (interactive)
  (setq mode-line-format (list " %b"))
  )
(add-hook 'term-mode-hook 'my/term-hook)
(add-hook 'sh-mode-hook 'hl-line-mode)

;; Mode-line config
(setq-default mode-line-format (list " %* %b\t<%l:%c %p>  \t<%m>"))
(setq-default smex-prompt-string "imperatum>")
(setq-default frame-title-format (list "%b"))


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

;; Disable keys that are annoying
(dolist (k '([mouse-1] [down-mouse-1] [drag-mouse-1] [double-mouse-1] [triple-mouse-1]  
             [mouse-2] [down-mouse-2] [drag-mouse-2] [double-mouse-2] [triple-mouse-2]
             [mouse-3] [down-mouse-3] [drag-mouse-3] [double-mouse-3] [triple-mouse-3]
             [mouse-4] [down-mouse-4] [drag-mouse-4] [double-mouse-4] [triple-mouse-4]
             [mouse-5] [down-mouse-5] [drag-mouse-5] [double-mouse-5] [triple-mouse-5]))
  (global-unset-key k))
(global-unset-key (kbd "<left>"))
(global-unset-key (kbd "<right>"))
(global-unset-key (kbd "<up>"))
(global-unset-key (kbd "<down>"))
(global-unset-key (kbd "<C-left>"))
(global-unset-key (kbd "<C-right>"))
(global-unset-key (kbd "<C-up>"))
(global-unset-key (kbd "<C-down>"))
(global-unset-key (kbd "<M-left>"))
(global-unset-key (kbd "<M-right>"))
(global-unset-key (kbd "<M-up>"))
(global-unset-key (kbd "<M-down>"))

;; In case of GUI
(fringe-mode 0)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Pair Mode
(electric-pair-mode 1)

;; FG and BG colors
(add-to-list 'default-frame-alist '(foreground-color . "#ffffff"))
(add-to-list 'default-frame-alist '(background-color . "#131412"))

;; Fixing special keys
(require 'iso-transl)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "fixed" :foundry "misc" :slant normal :weight normal :height 113 :width normal))))
 '(cursor ((t (:background "orange"))))
 '(hl-line ((t (:inherit nil :background "gray20"))))
 '(isearch ((t (:background "orange red" :foreground "white"))))
 '(mode-line ((t (:background "white" :foreground "black" :box nil))))
 '(mode-line-inactive ((t (:inherit mode-line :background "light gray" :foreground "black" :box nil :weight light))))
 '(region ((t (:background "orange red")))))
