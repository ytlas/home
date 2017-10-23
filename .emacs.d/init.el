;; The "meat" of this init.el

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(eshell)

(provide  '.emacs)
