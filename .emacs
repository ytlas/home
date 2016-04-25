;; Automatically install required packages
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
(ido-mode 1)

;; Display column number
(setq column-number-mode t)

;; Prevent welcome screen
(setq inhibit-startup-message t)

;; Helm binds
(global-set-key (kbd "M-x") 'helm-M-x)

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
