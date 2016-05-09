;; Packages setup
(setq package-list '(async emms expand-region google-translate multi-term popup undo-tree web-mode ido-ubiquitous smex google-translate flycheck magit auto-complete ace-jump-mode iy-go-to-char multiple-cursors smart-mode-line))
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(require 'iso-transl)

;; Defuns
(defun my/scroll-down()
  (interactive)
  (scroll-up)
  (recenter))
(defun my/scroll-up()
  (interactive)
  (scroll-down)
  (recenter))
(defun my/mm()
  (interactive)
  (message "%s" major-mode))
(defun my/term-hook()
  (interactive)
  (setq mode-line-format (list " %b")))
(add-hook 'isearch-mode-end-hook 'my-goto-match-beginning)
(defun my-goto-match-beginning ()
  (when (and isearch-forward isearch-other-end)
    (goto-char isearch-other-end)))
(defadvice isearch-exit (after my-goto-match-beginning activate)
  "Go to beginning of match."
  (when (and isearch-forward isearch-other-end)
    (goto-char isearch-other-end)))

;; Mode toggles
(menu-bar-mode -1)
(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)
(global-flycheck-mode 1)
(ac-config-default)
(blink-cursor-mode 0)
(tooltip-mode nil)
(setq show-help-function nil)
(transient-mark-mode 0)
(show-paren-mode 1)
(emms-standard)
(emms-default-players)
(fringe-mode 0)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(electric-pair-mode 1)

;; Variables
(setq-default frame-title-format (list "%b"))
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)

;; Hooks
(add-hook 'emacs-lisp-mode-hook 'hl-line-mode)
(add-hook 'web-mode-hook 'hl-line-mode)
(add-hook 'term-mode-hook 'my/term-hook)
(add-hook 'sh-mode-hook 'hl-line-mode)

;; Autoloads
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; Key unbindings
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

;; Key bindings
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
(global-set-key (kbd "C-v") 'my/scroll-down)
(global-set-key (kbd "M-v") 'my/scroll-up)

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
 '(region ((t (:background "orange")))))

;; Specific theme settings
(add-to-list 'default-frame-alist '(foreground-color . "#ffffff"))
(add-to-list 'default-frame-alist '(background-color . "#131412"))
(setq sml/theme 'light)
(sml/setup)
