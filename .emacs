; Package init
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; Evil mode
(require 'evil)
(evil-mode 1)

;; Some mode toggles
(tool-bar-mode -1)
(menu-bar-mode -1)
(blink-cursor-mode 0)
(fringe-mode 0)
(scroll-bar-mode -1)
(setq inhibit-startup-message t)

(setq make-backup-files nil)

(ido-mode t)
(global-set-key (kbd "C-h") 'previous-buffer)
(global-set-key (kbd "C-l") 'next-buffer)
(global-set-key (kbd "C-f") 'ido-find-file)

;: Remove "default" buffers
;; Makes *scratch* empty.
(setq initial-scratch-message "")

;; Removes *scratch* from buffer after the mode has been set.
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

;; Removes *messages* from the buffer.
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; Removes *Completions* from buffer after you've opened a file.
(add-hook 'minibuffer-exit-hook
	  '(lambda ()
	     (let ((buffer "*Completions*"))
	       (and (get-buffer buffer)
		    (kill-buffer buffer)))))

;; Don't show *Buffer list* when opening multiple files at the same time.
(setq inhibit-startup-buffer-menu t)

;; Show only one active window when opening multiple files at the same time.
(add-hook 'window-setup-hook 'delete-other-windows)
