(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
   In Delete Selection mode, if the mark is active, just deactivate it;
   then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
use-package evil
  :init
  (progn
    (setq evil-want-integration t)
    (setq evil-want-keybinding nil)
    (setq evil-default-cursor t)
    (setq evil-want-C-u-scroll t) ; Allow C-u to move up half a screen
    (setq evil-toggle-key "C-\\")
    ;;; (use-package evil-leader
    ;;;   :init (global-evil-leader-mode)
    ;;;   :config
    ;;;   (progn
	;;; (setq evil-leader/in-all-states t)
	;;; (evil-leader/set-leader ",")
	;;; (evil-leader/set-key
	;;;   "e" 'neotree-toggle
	;;;   ;; "t" 'fiplr-find-file 
	;;;   )))
    (evil-mode 1))
  :config
  (progn
    (define-key evil-insert-state-map [escape] 'evil-normal-state)
    (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
    (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

    ;; setup evil
    (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
    (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-enter)
    (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
    (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)

					; (define-key evil-normal-state-map [escape] 'keyboard-quit)
					; (define-key evil-visual-state-map [escape] 'keyboard-quit)
					; (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
					; (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
					; (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
					; (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
					; (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
					; (global-set-key [escape] 'evil-exit-emacs-state)
    ))
(use-package evil-collection
  :after evil
  :custom (evil-collection-setup-minibuffer t)
  :config
  (setq evil-collection-magit-state 'normal)
  (setq evil-collection-magit-use-y-for-yank nil)
  (with-eval-after-load 'magit-repos (evil-collection-magit-setup))
  (setq evil-collection-mode-list (delete 'simple evil-collection--supported-modes))
  (evil-collection-init))
(provide 'init-evil)
