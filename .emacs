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

;; Display column number
(setq column-number-mode t)

;; Prevent welcome screen
(setq inhibit-startup-message t)

;; Helm binds
;;(global-set-key (kbd "M-x") 'helm-M-x)

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
