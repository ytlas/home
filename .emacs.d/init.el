;;; Adam's amazing init.el
;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; Removes GUI crap before anything
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(fringe-mode 0)

;; Identification
(setq user-full-name "ytlas")
(setq user-mail-address "adam@ytlas.com")

;;; Packages setup
;; List of packages that will install unless already installed
(setq package-list '(expand-region multi-term web-mode flycheck magit auto-complete ace-jump-mode iy-go-to-char multiple-cursors pdf-tools smex emms))
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; Install missing packages from variable package-list
(unless package-archive-contents
  (package-refresh-contents))
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Defaults backup files to store in temporary filedirectory (depending on OS)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Fixes some foreign keyboard problems (like dead-tilde)
(require 'iso-transl)

;;; Defuns
;; Scrolls up and down and centers screen around cursor
(defun my/scroll-down()
  (interactive)
  (scroll-up)
  (recenter)
  )
(defun my/scroll-up()
  (interactive)
  (scroll-down)
  (recenter)
  )

;; Prints variable major-mode
(defun my/mm()
  (interactive)
  (message "%s" major-mode))

;; When in term, only show buffer-name in mode-line
(defun my/term-hook()
  (interactive)
  (setq mode-line-format " %b "))

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
;; Treats CamelCase words as distinct words
(subword-mode 1)

;; Winner mode (remember window configurations)
(winner-mode 1)

;; Narrowing list modes
;; (ido-mode 1)
;; (ido-ubiquitous-mode 1)

;; Disables annoying GUI help
(tooltip-mode nil)
(setq show-help-function nil)

;; Enable auto-completion
;; (ac-config-default)

;; Shows matching paren
(show-paren-mode 1)

;; Misc
(emms-standard)
(emms-default-players)
;; (electric-pair-mode 1)
(blink-cursor-mode 0)

;;; Variables
;; Makes point move by logical lines
(setq line-move-visual nil)

;; Sets the initial scratch buffer content
(setq initial-scratch-message ";; Fuck you\n\n")

;; Enables flexible string matching with various ido-modes
(setq ido-enable-flex-matching t)
(setq smex-flex-matching t)

;; Changes the look of the mode-line
(setq-default mode-line-format " %* %b  %m  %f  %l:%c  %p ")

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
;; Cleans up trailing whitespace
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook (lambda() (delete-trailing-whitespace)))

;; Enables hl-line-mode in certain major modes
(add-hook 'emacs-lisp-mode-hook 'hl-line-mode)
(add-hook 'sh-mode-hook 'hl-line-mode)
(add-hook 'web-mode-hook 'hl-line-mode)
(add-hook 'python-mode-hook 'hl-line-mode)
(add-hook 'css-mode-hook 'hl-line-mode)
(add-hook 'conf-space-mode-hook 'hl-line-mode)
(add-hook 'c-mode-hook 'hl-line-mode)

;; Changes mode-line when in term-mode
(add-hook 'term-mode-hook 'my/term-hook)

;;; Autoloads
;; Enables web-mode in "web-files"
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))

;;; Key unbindings
;; Unbinds annoying keys that I never use
;; (dolist (k '([mouse-1] [down-mouse-1] [drag-mouse-1] [double-mouse-1] [triple-mouse-1] [mouse-2] [down-mouse-2] [drag-mouse-2] [double-mouse-2] [triple-mouse-2] [mouse-3] [down-mouse-3] [drag-mouse-3] [double-mouse-3] [triple-mouse-3] [mouse-4] [down-mouse-4] [drag-mouse-4] [double-mouse-4] [triple-mouse-4] [mouse-5] [down-mouse-5] [drag-mouse-5] [double-mouse-5] [triple-mouse-5] [M-down] [M-up]  [M-right]  [M-left]  [C-down]  [C-up]  [C-right]  [C-left]  [down]  [up]  [right] [left] [C-c f]))
(dolist (k '([mouse-1] [down-mouse-1] [double-mouse-1] [triple-mouse-1] [down-mouse-2] [drag-mouse-2] [double-mouse-2] [triple-mouse-2] [mouse-3] [down-mouse-3] [drag-mouse-3] [double-mouse-3] [triple-mouse-3] [mouse-4] [down-mouse-4] [drag-mouse-4] [double-mouse-4] [triple-mouse-4] [mouse-5] [down-mouse-5] [drag-mouse-5] [double-mouse-5] [triple-mouse-5] [M-down] [M-up]  [M-right]  [M-left]  [C-down]  [C-up]  [C-right]  [C-left]  [down]  [up]  [right] [left] [C-c f]))
  (global-unset-key k))

;;; Key bindings
;; Narrowing list M-x
(global-set-key (kbd "M-x") 'smex)

;; Windmove
(global-set-key (kbd "C-c b") 'windmove-left)
(global-set-key (kbd "C-c f") 'windmove-right)
(global-set-key (kbd "C-c p") 'windmove-up)
(global-set-key (kbd "C-c n") 'windmove-down)
(global-set-key (kbd "M-o") 'other-window)

;; Indent when RET is pressed
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Binds F5 to create a new multi-term
(global-set-key (kbd "þ") 'multi-term)

;; Navigation binds
(global-set-key (kbd "€") 'er/expand-region)
(global-set-key (kbd "ª") 'ace-jump-mode)
(global-set-key (kbd "→") 'iy-go-up-to-char)
(global-set-key (kbd "C-→") 'iy-go-up-to-char-backward)

;; Multiple-cursors binds
(global-set-key (kbd "µ") 'mc/mark-next-like-this)
(global-set-key (kbd "ł") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-ł") 'mc/unmark-previous-like-this)
(global-set-key (kbd "C-µ") 'mc/unmark-next-like-this)
(global-set-key (kbd "C-c C-M-µ") 'mc/edit-lines)
(global-set-key (kbd "C-M-µ") 'mc/mark-all-like-this)

;; Custom scroll binds
(global-set-key (kbd "C-v") 'my/scroll-down)
(global-set-key (kbd "M-v") 'my/scroll-up)

;; Comment binds
(global-set-key (kbd "©") 'comment-region)
(global-set-key (kbd "C-©") 'uncomment-region)

;;; Put auto-generated code in separate file (~/.emacs.d/custom.el)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;;; Specific theme settings
;; (add-to-list 'default-frame-alist '(foreground-color . "#131412"))
;; (add-to-list 'default-frame-alist '(background-color . "#ffffff"))
(set-face-attribute 'mode-line nil :font "Ubuntu Mono-16")
(set-face-attribute 'default nil :font "Ubuntu Mono-13")

(provide  '.emacs)
;;; .emacs ends here
