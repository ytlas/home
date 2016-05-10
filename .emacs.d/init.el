;;; package --- Summary
;;; Commentary:
;; Adam's .emacs config, I know, not the best, but it works superwell!
;; READ: The config is optimized for XEmacs, everything might not work on terminal emulators like rxvt or xterm (color problems and such).
;; However, with a tweak or two, it should work perfectly.
;;; Code:
;; Removes GUI crap before anything
(menu-bar-mode -1)
(fringe-mode 0)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Identification
(setq user-full-name "ytlas")
(setq user-mail-address "adam@ytlas.com")

;;; Packages setup
;; List of packages that will install unless already installed
(setq package-list '(async emms expand-region google-translate multi-term popup undo-tree web-mode flycheck magit auto-complete ace-jump-mode iy-go-to-char multiple-cursors helm google-this))
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
  (recenter))
(defun my/scroll-up()
  (interactive)
  (scroll-down)
  (recenter))

;; Prints variable major-mode
(defun my/mm()
  (interactive)
  (message "%s" major-mode))

;; When in term, only show buffer-name in mode-line
(defun my/term-hook()
  (interactive)
  (setq mode-line-format (list " %b")))

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
;; Show correction
(global-flycheck-mode 1)

;; Disables annoying GUI help
(tooltip-mode nil)
(setq show-help-function nil)

;; Enable auto-completion
(ac-config-default)

;; Don't show region all the time
;;(transient-mark-mode 0)

;; Shows matching paren
(show-paren-mode 1)

;; Misc
(emms-standard)
(emms-default-players)
(electric-pair-mode 1)
(blink-cursor-mode 0)

;;; Variables
;; Enable fuzzy search in all of helm
(setq helm-mode-fuzzy-match t)

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

;; Shows trailing whitespace
(setq-default show-trailing-whitespace t)

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

;;; Key unbindings
;; Unbinds annoying keys that I never use
(dolist (k '([mouse-1] [down-mouse-1] [drag-mouse-1] [double-mouse-1] [triple-mouse-1] [mouse-2] [down-mouse-2] [drag-mouse-2] [double-mouse-2] [triple-mouse-2] [mouse-3] [down-mouse-3] [drag-mouse-3] [double-mouse-3] [triple-mouse-3] [mouse-4] [down-mouse-4] [drag-mouse-4] [double-mouse-4] [triple-mouse-4] [mouse-5] [down-mouse-5] [drag-mouse-5] [double-mouse-5] [triple-mouse-5] [M-down] [M-up]  [M-right]  [M-left]  [C-down]  [C-up]  [C-right]  [C-left]  [down]  [up]  [right] [left]))
  (global-unset-key k))

;;; Key bindings
;; Hippie expand
(global-set-key (kbd "M-8") 'hippie-expand)

;; Indent when RET is pressed
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Helm (narrowing-lists framework)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x r b") 'helm-bookmarks)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-i") 'helm-imenu)

;; Moves by logical lines with <C-n/p>
(global-set-key (kbd "C-n") 'next-logical-line)
(global-set-key (kbd "C-p") 'previous-logical-line)

;; Binds F5 to create a new multi-term
(global-set-key (kbd "<f5>") 'multi-term)

;; Emms custom bindings
(global-set-key (kbd "C-c d") 'emms-add-directory-tree)
(global-set-key (kbd "C-c m") 'emms)

;; Magit binds
(global-set-key (kbd "C-c p") 'magit-push)
(global-set-key (kbd "C-c c") 'magit-commit)

;; Navigation binds
(global-set-key (kbd "C-@") 'er/expand-region)
(global-set-key (kbd "C-ö") 'ace-jump-mode)
(global-set-key (kbd "M-m") 'iy-go-up-to-char)
(global-set-key (kbd "M-C-m") 'iy-go-to-char-backward)

;; Multiple-cursors binds
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c C-/") 'mc/mark-sgml-tag-pair)

;; Custom scroll binds
(global-set-key (kbd "C-v") 'my/scroll-down)
(global-set-key (kbd "M-v") 'my/scroll-up)

;; Google-binds
(global-set-key (kbd "C-c C-g") 'google-this)
(global-set-key (kbd "C-c C-t") 'google-translate-query-translate)

;; Follow mode bind
(global-set-key (kbd "C-c f") 'follow-mode)

;; Comment binds
(global-set-key (kbd "M-9") 'comment-region)
(global-set-key (kbd "C-M-9") 'uncomment-region)

;;; Auto generated code (from customize-group etc.)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("36d92f830c21797ce34896a4cf074ce25dbe0dabe77603876d1b42316530c99d" "fbcdb6b7890d0ec1708fa21ab08eb0cc16a8b7611bb6517b722eba3891dfc9dd" "2a5be663818e1e23fd2175cc8dac8a2015dcde6b2e07536712451b14658bbf68" "beeb5ac6b65fcccfe434071d4624ff0308b5968bf2f0c01b567d212bcaf66054" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "b04425cc726711a6c91e8ebc20cf5a3927160681941e06bc7900a5a5bfe1a77f" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "dark orange"))))
 '(highlight ((t (:background "gray32"))))
 '(mc/cursor-face ((t (:foreground "gold" :inverse-video t))))
 '(mode-line ((t (:background "white" :foreground "black" :box nil))))
 '(mode-line-inactive ((t (:inherit mode-line :background "dark gray" :foreground "black" :box nil :weight light))))
 '(region ((t (:background "DarkOrange3")))))

;;; Specific theme settings
(add-to-list 'default-frame-alist '(foreground-color . "#ffffff"))
(add-to-list 'default-frame-alist '(background-color . "#131412"))

(provide  '.emacs)
;;; .emacs ends here
