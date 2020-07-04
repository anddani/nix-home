;; Setup emacs gui
(setq inhibit-startup-message t)
(global-linum-mode t)
(menu-bar-mode t)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(blink-cursor-mode 0)

(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path (concat (getenv "HOME") "/.local/bin"))

;; Move all backup files to separate directory
(setq backup-directory-alist `(("." . "~/.emacs.d/emacs-backups")))

(setq-default indent-tabs-mode nil)

;; Set json indentation to 2 spaces
(add-hook 'json-mode-hook
          (lambda ()
	    (make-local-variable 'js-indent-level)
	    (setq js-indent-level 2)))

;; Evil
(require 'evil)
(require 'evil-leader)
(setq evil-default-cursor t)
(setq evil-want-C-u-scroll t) ; Allow C-u to move up half a screen
(setq evil-toggle-key "C-\\")
(setq evil-leader/set-leader ",")
(setq evil-leader/in-all-states t)
(evil-mode 1)

;; Gruvbox
(require 'gruvbox-theme)
(load-theme 'gruvbox-dark-soft t)

;; Magit
(require 'evil-magit)
(setq split-height-threshold nil)
(setq split-width-threshold 0)
(global-set-key (kbd "C-c g") 'magit-status)
(define-key magit-mode-map "V" #'endless/visit-pull-request-url)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(magit-pull-arguments nil)
  '(package-selected-packages
     (quote
       (markdown-mode helm-config evil-magit json-mode dracula-theme evil-leader evil)))
  '(safe-local-variable-values
     (quote
       ((haskell-process-use-ghci . t)
	(haskell-indent-spaces . 4)))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  )

(find-file "~/todo.org")
