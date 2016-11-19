;;; Adam's amazing init.el
;; Turn off mouse interface early in startup to avoid momentary display
;; (when window-system (set-frame-size (selected-frame) 90 45))
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;; (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; Identification
(setq user-full-name "ytlas")
(setq user-mail-address "adam@ytlas.com")

;;; Packages setup
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(fringe-mode 0)

(defun ensure-package-installed(&rest packages)
  (mapcar
   (lambda(package)
     (if(package-installed-p package)
	 nil
       (if(y-or-n-p(format "Package %s is missing, install it? " package))
	   (package-install package)
	 package)))
   packages))
(or(file-exists-p package-user-dir)
   (package-refresh-contents))

(ensure-package-installed 'expand-region 'flycheck 'iy-go-to-char 'web-mode 'js2-mode 'wrap-region 'haskell-mode 'flymake-hlint 'exwm)

;; Exwm setup
;; (require 'exwm)
;; (require 'exwm-config)
;; (exwm-config-default)

;; Defaults backup files to store in temporary filedirectory (depending on OS)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;; Defuns
;; Position cursor at beginning of match when using Isearch
(add-hook 'isearch-mode-end-hook 'my-goto-match-beginning)
(defun my-goto-match-beginning ()
  (when (and isearch-forward isearch-other-end)
    (goto-char isearch-other-end)))
(defadvice isearch-exit (after my-goto-match-beginning activate)
  "Go to beginning of match."
  (when (and isearch-forward isearch-other-end)
    (goto-char isearch-other-end)))

;;; Mode toggles
;; If there is one or more batteries, display their combined calculated charge remaining
;; (display-battery-mode)

;; Column number mode
(column-number-mode 1)

;; Ido mode
(ido-mode 0)

;; Wrap-region mode
(wrap-region-global-mode)

;; Enables correction suggestions, errors and warnings in various programming languages
(global-flycheck-mode)

;; Disables annoying GUI help
(tooltip-mode nil)
(setq show-help-function nil)

;; Shows matching paren
(show-paren-mode 1)

;;; Variables
;; Exwm vars
;; (setq-default exwm-layout-show-all-buffers t)

;; Displays date and time
;; (setq display-time-day-and-date t
;;       display-time-24hr-format t)
;; (display-time)

;; Makes point move by logical lines
(setq line-move-visual nil)

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

;; Exwm hooks
;; (add-hook 'exwm-manage-finish-hook
;;	  (lambda ()
;;	    (when (and exwm-class-name
;;		       (string= exwm-class-name "URxvt"))
;;	      (setq-local exwm-input-prefix-keys '(?\C-x)))))

;; Cleans up trailing whitespace
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook (lambda() (delete-trailing-whitespace)))

;; Enables hl-line-mode in certain major modes
(add-hook 'emacs-lisp-mode-hook 'hl-line-mode)
(add-hook 'sh-mode-hook         'hl-line-mode)
(add-hook 'web-mode-hook        'hl-line-mode)
(add-hook 'python-mode-hook     'hl-line-mode)
(add-hook 'css-mode-hook        'hl-line-mode)
(add-hook 'conf-space-mode-hook 'hl-line-mode)
(add-hook 'c-mode-hook          'hl-line-mode)
(add-hook 'flymake-mode-hook    'hl-line-mode)

;;; Autoloads
(add-to-list 'auto-mode-alist '("\\.js\\'"   . js2-mode))
(add-to-list 'auto-mode-alist '("\\.ejs\\'"  . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'"  . css-mode))

;;; Key unbindings
;; Unbinds annoying keys that I never use
;; (dolist (k '([mouse-1] [down-mouse-1] [double-mouse-1] [triple-mouse-1] [down-mouse-2] [drag-mouse-2] [double-mouse-2] [triple-mouse-2] [mouse-3] [down-mouse-3] [drag-mouse-3] [double-mouse-3] [triple-mouse-3] [mouse-4] [down-mouse-4] [drag-mouse-4] [double-mouse-4] [triple-mouse-4] [mouse-5] [down-mouse-5] [drag-mouse-5] [double-mouse-5] [triple-mouse-5] [M-down] [M-up]  [M-right]  [M-left]  [C-down]  [C-up]  [C-right]  [C-left]  [down]  [up]  [right] [left] [C-c f] [C-z]))
;;  (global-unset-key k))

;;; Global key binds
;; Exwm binds
;; (exwm-input-set-key (kbd "s-<return>") (lambda ()       (interactive)(start-process "" nil "urxvt")))
;; (exwm-input-set-key (kbd "s-b")        (lambda ()       (interactive)(start-process "" nil "firefox-esr")))
;; (exwm-input-set-key (kbd "s-l")        (lambda ()       (interactive)(start-process "" nil "slock")))
;; (exwm-input-set-key (kbd "s-<left>")   (lambda ()       (interactive)(start-process "" nil "sudo"    "abl"      "-5")))
;; (exwm-input-set-key (kbd "s-<right>")  (lambda ()       (interactive)(start-process "" nil "sudo"    "abl"      "+5")))
;; (exwm-input-set-key (kbd "s-<up>")     (lambda ()       (interactive)(start-process "" nil "ponymix" "increase" "5" "--max-volume" "200")))
;; (exwm-input-set-key (kbd "s-<down>")   (lambda ()       (interactive)(start-process "" nil "ponymix" "decrease" "5" "--max-volume" "200")))
;; (exwm-input-set-key (kbd "s-d")        (lambda (command)(interactive (list (read-shell-command "$ ")))(start-process-shell-command command nil command)))
;; (exwm-input-set-key (kbd "s-w")        'kill-buffer-and-window)

;; Flymake
(global-set-key (kbd "C-c C-e") 'flymake-popup-current-error-menu)
(global-set-key (kbd "C-c C-n") 'flymake-goto-next-error)
(global-set-key (kbd "C-c C-p") 'flymake-goto-prev-error)

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
;; (add-to-list 'default-frame-alist '(foreground-color . "#ffffff"))
;; (add-to-list 'default-frame-alist '(background-color . "#000000"))
(set-face-attribute 'mode-line nil :font "10x20")
(set-face-attribute 'default nil :font "-Misc-Fixed-Medium-R-Normal--18-120-100-100-C-90-ISO10646-1")

(provide  '.emacs)
;;; .emacs ends here
