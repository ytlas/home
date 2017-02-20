;;; Adam's amazing init.el
;; Turn off mouse interface early in startup to avoid momentary display
;; (when window-system (set-frame-size (selected-frame) 90 45))
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;; (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; Identification
(setq user-mail-address "rabbitfood@posteo.net")
;;; Packages setup
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(display-battery-mode 1)

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

(ensure-package-installed 'expand-region 'flycheck 'iy-go-to-char 'multi-web-mode 'web-mode 'js2-mode 'wrap-region 'haskell-mode 'flymake-hlint 'jdee)

;; Defaults backup files to store in temporary filedirectory (depending on OS)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;; Mode toggles
;; Column number mode
(column-number-mode 1)

;; Ido mode
(ido-mode 1)

;; Wrap-region mode
(wrap-region-global-mode)

;; Enables correction suggestions, errors and warnings in various programming languages
(global-flycheck-mode)

;; Disables annoying GUI help
(tooltip-mode nil)
(setq show-help-function nil)

;; Shows matching paren
(show-paren-mode 1)

;; Date time format
(display-time-mode 1)

;;; Variables
;; Sets the initial scratch buffer content
(setq initial-scratch-message ";; :)\n")

;; Disable annoying prompts
(setq confirm-nonexistent-file-or-buffer nil)
(setq inhibit-startup-echo-area-message t)
(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
	 kill-buffer-query-functions))

;; Set everything to utf-8
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-language-environment 'utf-8)
(set-selection-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)

;; Sets window title to buffer name
(setq-default frame-title-format (list "%b"))

;; Disables Emacs welcome screen
(setq inhibit-startup-message t)

;; Replaces yes-or-no prompts with y-or-n prompts
(fset 'yes-or-no-p 'y-or-n-p)

;;; Hooks
;; Hlint for haskell
(add-hook 'haskell-mode-hook 'flymake-hlint-load)

;; Cleans up trailing whitespace
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook (lambda() (delete-trailing-whitespace)))

;; ;; Multi-web-mode
;; (require 'multi-web-mode)
;; (setq mweb-default-major-mode 'html-mode)
;; (setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
;;		  (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
;;		  (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
;; (setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))

;;; Autoloads
(add-to-list 'auto-mode-alist '("\\.js\\'"   . js2-mode))
(add-to-list 'auto-mode-alist '("\\.ejs\\'"  . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'"  . css-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))

;; Windmove
(global-set-key (kbd "C-c b") 'windmove-left)
(global-set-key (kbd "C-c f") 'windmove-right)
(global-set-key (kbd "C-c p") 'windmove-up)
(global-set-key (kbd "C-c n") 'windmove-down)
(global-set-key (kbd "M-o") 'other-window)

;; Navigation binds
(global-set-key (kbd "€") 'er/expand-region)
(global-set-key (kbd "→") 'iy-go-up-to-char)
(global-set-key (kbd "C-→") 'iy-go-up-to-char-backward)

;; Comment binds
(global-set-key (kbd "©") 'comment-region)
(global-set-key (kbd "C-©") 'uncomment-region)

;;; Put auto-generated code in separate file (~/.emacs.d/custom.el)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;;; Specific theme settings
;;(add-to-list 'default-frame-alist '(foreground-color . "#ffffff"))
;;(add-to-list 'default-frame-alist '(background-color . "#000000"))
(set-face-attribute 'mode-line nil :font "10x20")
(set-face-attribute 'default nil :font "-Misc-Fixed-Medium-R-Normal--18-120-100-100-C-90-ISO10646-1")


(provide  '.emacs)
;;; .emacs ends here
