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
(ensure-package-installed 'expand-region 'web-mode)
;; Store backup files in /tmp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;; Modes
(scroll-bar-mode -1)
(tool-bar-mode -1)
(display-battery-mode 1)
(menu-bar-mode 0)

;; Shows matching parentheses
(show-paren-mode 1)

;; Date time format
(display-time-mode 1)

;;; Variables
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

;;; Key bindings
;; Navigation
(global-set-key (kbd "€") 'er/expand-region)

;; Shell
(global-set-key (kbd "þ") (lambda() (interactive) (eshell t)))

;; Comment binds
(global-set-key (kbd "©") 'comment-region)
(global-set-key (kbd "C-©") 'uncomment-region)

;; Other shit
(set-face-attribute 'mode-line nil :font "10x20")
(set-face-attribute 'default nil :font "-Misc-Fixed-Medium-R-Normal--18-120-100-100-C-90-ISO10646-1")

(provide  '.emacs)
