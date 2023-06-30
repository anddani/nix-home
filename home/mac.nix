{ config, lib, pkgs, ... }:
{
  imports = [
    ./modules/home-manager.nix
    ./modules/common.nix
    ./modules/fish.nix
    ./modules/neovim
    ./modules/emacs.nix
    ./modules/kitty.nix
  ];


  home = {
    username = "andredanielsson";
    homeDirectory = "/Users/andredanielsson";
    stateVersion = "20.09";
  };
  home.file.".ideavimrc".text = ''
    set surround
    set incsearch
    set hlsearch

    let mapleader = ","

    map <Space> zz
    map <leader>rc :action ReformatCode<CR>
    map <leader>gf :action GotoFile<CR>
    map <leader>gc :action GotoClass<CR>
    map <leader>gs :action GotoSymbol<CR>
  '';
  home.file.".emacs.d/init.el".text = ''
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

      (require 'use-package)

      ;; Evil
      (defun minibuffer-keyboard-quit ()
        "Abort recursive edit.
         In Delete Selection mode, if the mark is active, just deactivate it;
         then it takes a second \\[keyboard-quit] to abort the minibuffer."
        (interactive)
        (if (and delete-selection-mode transient-mark-mode mark-active)
            (setq deactivate-mark  t)
          (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
          (abort-recursive-edit)))
      (use-package evil
        :init
        (progn
          (setq evil-want-integration t)
          (setq evil-want-keybinding nil)
          (setq evil-default-cursor t)
          (setq evil-want-C-u-scroll t) ; Allow C-u to move up half a screen
          (setq evil-toggle-key "C-\\")
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


      (setq evil-want-keybinding nil)
      (require 'evil)
      (require 'evil-leader)
      (setq evil-default-cursor t)
      (setq evil-want-C-u-scroll t) ; Allow C-u to move up half a screen
      (setq evil-toggle-key "C-\\")
      (setq evil-leader/set-leader ",")
      (setq evil-leader/in-all-states t)
      (evil-mode 1)
      (global-set-key (kbd "\C-c w") #'evil-window-map)

      (require 'evil-collection)
      (evil-collection-init)

      ;; Magit
      (use-package magit
        :init
        (progn
          (setq split-height-threshold nil)
          (setq split-width-threshold 0))
        :bind
        (("C-c g" . magit-status))
        :config
        (eval-after-load 'magit
          '(define-key magit-mode-map "V"
             #'endless/visit-pull-request-url)))

      (setq split-height-threshold nil)
      (setq split-width-threshold 0)
      (global-set-key (kbd "C-c g") 'magit-status)
      ;; (define-key magit-mode-map "V" #'endless/visit-pull-request-url)

      ;; Gruvbox
      (require 'gruvbox-theme)
      (load-theme 'gruvbox-dark-soft t)

      ;; Helm
      (use-package helm
        :ensure t
        :init
        (setq helm-mode-fuzzy-match t)
        (setq helm-completion-in-region-fuzzy-match t)
        (setq helm-candidate-number-list 50)
        :bind (("C-x C-f" . helm-find-files)
               ("C-x b" . helm-buffers-list)))

      (require 'helm)
      (setq helm-mode-fuzzy-match t)
      (setq helm-completion-in-region-fuzzy-match t)
      (setq helm-candidate-number-list 50)
      (global-set-key (kbd "C-x C-f") 'helm-find-files)
      (global-set-key (kbd "C-x b") 'helm-buffers-list)

      (find-file "~/todo.org")
  '';
}
