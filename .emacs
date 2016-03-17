(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; Some mode toggles
(tool-bar-mode -1)
(menu-bar-mode -1)
(blink-cursor-mode 0)
(fringe-mode 0)
(scroll-bar-mode -1)
(ido-mode 1)

;; Set auto- and backup directory
(setq backup-directory-alist
    `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
    `((".*" ,temporary-file-directory t)))

(when (require 'multi-term nil t)
  (global-set-key (kbd "<f5>") 'multi-term)
  (global-set-key (kbd "<C-next>") 'multi-term-next)
  (global-set-key (kbd "<C-prior>") 'multi-term-prev)
  (setq multi-term-buffer-name "term"
        multi-term-program "/bin/bash"))

;; Clean buffers
(clean-buffer-list)

;; Don't add newline at end of file
(setq mode-require-final-newline nil)

;; Functions
(defun my/nld ()
  (interactive)
  (end-of-line)
  (newline-and-indent))
(defun my/nlu ()
  (interactive)
  (previous-line)
  (end-of-line)
  (newline-and-indent))

;; Key binds
(global-set-key (kbd "C-k") 'kill-whole-line)
(global-set-key (kbd "C-S-o") 'my/nlu)
(global-set-key (kbd "C-o") 'my/nld)
(global-set-key (kbd "C-a") 'beginning-of-line-text)

;; EMMS
(require 'emms-setup)
(emms-standard)
(emms-default-players)
(global-set-key (kbd "C-c +") 'emms-volume-mode-plus)
(global-set-key (kbd "C-c -") 'emms-volume-mode-minus)