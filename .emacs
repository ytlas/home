(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; Evil mode
(require 'evil)
(evil-mode 1)

;; powerline-evil
(require 'powerline)
(powerline-evil-vim-color-theme)
(display-time-mode t)

;; Some mode toggles
(tool-bar-mode -1)
(menu-bar-mode -1)
(blink-cursor-mode 0)
(fringe-mode 0)
(scroll-bar-mode -1)
(setq inhibit-startup-message t)
(ido-mode 1)

;; Set auto- and backup directory
(setq backup-directory-alist
    `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
    `((".*" ,temporary-file-directory t)))

;; Cursor
;;(setq cursor-type 'box)
;;(setq evil-insert-state-cursor 'box)

(when (require 'multi-term nil t)
  (global-set-key (kbd "<f5>") 'multi-term)
  (global-set-key (kbd "<C-next>") 'multi-term-next)
  (global-set-key (kbd "<C-prior>") 'multi-term-prev)
  (setq multi-term-buffer-name "term"
        multi-term-program "/bin/bash"))


;;; Default theme
(custom-set-variables
; ;; custom-set-variables was added by Custom.
; ;; If you edit it by hand, you could mess it up, so be careful.
; ;; Your init file should contain only one such instance.
; ;; If there is more than one, they won't work right.
; '(custom-enabled-themes (quote (badwolf)))
; '(custom-safe-themes
;   (quote
;    ("c95a117efd4eeefc410aa55ea883f74f07ffd64a887538e629a6c7f845fa6add" default)))
 '(initial-frame-alist (quote ((fullscreen . maximized)))))
;(custom-set-faces
; ;; custom-set-faces was added by Custom.
; ;; If you edit it by hand, you could mess it up, so be careful.
; ;; Your init file should contain only one such instance.
; ;; If there is more than one, they won't work right.
; '(cursor ((t (:background "white"))))
; '(linum ((t (:background "#1c1b1a" :foreground "white")))))

;; Escape quits things
;; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

;; Clean buffers
(clean-buffer-list)

;; Don't add newline at end of file
(setq mode-require-final-newline nil)