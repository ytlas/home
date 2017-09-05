;;; Packages setup
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
;; Ensure certain packages are installed
(defun ensure-package-installed(&rest packages)
  (mapcar
   (lambda(package)
     (if(package-installed-p package)
	 nil
       (package-install package)
       package))
   packages))
(or(file-exists-p package-user-dir)
   (package-refresh-contents))
(ensure-package-installed 'expand-region 'web-mode 'flycheck 'helm 'yasnippet 'dirtree 'company 'expand-region 'folding 'auctex)
;; Store backup files in /tmp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;; Modes
(scroll-bar-mode -1)
(tool-bar-mode -1)
;(display-battery-mode 1)
(column-number-mode 1)
(menu-bar-mode 0)
(subword-mode 1)
(fringe-mode -1)
(add-hook 'after-init-hook 'global-flycheck-mode)
(add-hook 'after-init-hook 'global-company-mode)
(require 'dirtree)

;; Shows matching parentheses
(show-paren-mode 1)

;; Date time format
(display-time-mode 1)

;;; Variables
;; Disable lock-files
(setq create-lockfiles nil)

;; Disables Emacs welcome screen
(setq inhibit-startup-message t)

;; Replaces yes-or-no prompts with y-or-n prompts
(fset 'yes-or-no-p 'y-or-n-p)

;;; Put auto-generated code in separate file (~/.emacs.d/custom.el)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;;; Hooks
;; Cleans up trailing whitespace
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook (lambda() (delete-trailing-whitespace)))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ejs\\'"  . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'"  . css-mode))
(defun my-php-folding-hook ()
   (folding-mode 1))
(add-hook 'web-mode-hook 'my-php-folding-hook)

(load "folding" 'nomessage 'noerror)
(folding-mode-add-find-file-hook)
(folding-add-to-marks-list 'web-mode "//{{{" "//}}}" nil t)

;;; Key bindings
;; Helm
;; (global-set-key (kbd "M-x") 'helm-M-x)
;; (global-set-key (kbd "C-x b") 'helm-buffers-list)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)

(windmove-default-keybindings)
;; Navigation
(global-set-key (kbd "€") 'er/expand-region)

;;; Key unbindings
(global-unset-key (kbd "C-z"))

;; Shell
(global-set-key (kbd "þ") (lambda() (interactive) (eshell t)))

;; Toggle fold
(global-set-key (kbd "đ") 'folding-toggle-show-hide)

;; Comment binds
(global-set-key (kbd "©") 'comment-region)
(global-set-key (kbd "C-©") 'uncomment-region)

;; Other shit
(set-face-attribute 'mode-line nil :font "10x20")
(set-face-attribute 'default nil :font "-Misc-Fixed-Medium-R-Normal--18-120-100-100-C-90-ISO10646-1")
;; (add-to-list 'default-frame-alist '(foreground-color . "#ffffff"))

(provide  '.emacs)
