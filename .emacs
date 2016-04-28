;; Automatically install required packages
(setq package-list '(async auto-complete emms expand-region google-translate helm helm-core multi-term popup undo-tree web-mode ido-ubiquitous smex))
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

;; eliminate long "yes" or "no" prompts
(fset 'yes-or-no-p 'y-or-n-p)

;; Pophint menu
(global-set-key (kbd "C-x p") 'pophint:do)

;; Abbrevs
;;(setq-default abbrev-mode t)
;;(quietly-read-abbrev-file)

;; Expand region
(global-set-key (kbd "C-x C-r") 'er/expand-region)

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

(add-hook 'lisp-mode-hook '(lambda ()
			     (local-set-key (kbd "RET") 'newline-and-indent)))

;; Pair Mode
(electric-pair-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (abyss)))
 '(custom-safe-themes
   (quote
    ("45712b65018922c9173439d9b1b193cb406f725f14d02c8c33e0d2cdad844613" "f9574c9ede3f64d57b3aa9b9cef621d54e2e503f4d75d8613cbcc4ca1c962c21" "9a77026c04c2b191637239d0a2374b2cf019eb457a216f6ecc391a4a42f6ed08" default)))
 '(notmuch-search-line-faces
   (quote
    (("unread" :foreground "#8cffba")
     ("flagged" :foreground "#ff2c4b")
     ("deleted" :foreground "#ff9eb8" :bold t))))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Anonymous Pro for Powerline" :foundry "unknown" :slant normal :weight bold :height 128 :width normal))))
 '(cursor ((t (:background "white"))))
 '(mode-line ((t (:background "gainsboro" :foreground "black" :height 1.0))))
 '(mode-line-buffer-id ((t (:background "gainsboro" :foreground "black" :weight bold :height 1.0)))))
