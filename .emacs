(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; Create kbd macro to correct indentation in entire buffer
(fset 'indent-buffer
   "\C-xh\234")

;; to setup tabs
(setq c-basic-indent 2)
(setq tab-width 4)
(setq indent-tabs-mode nil)

;; nice font scaling shortcuts
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; enable auto-complete-mode all the time
(require 'auto-complete)
(global-auto-complete-mode t)

(global-set-key (kbd "C-x p") 'anything-git-goto)

;; (load-theme 'monokai t)

(when (require 'yasnippet nil 'noerror)
  (progn
    (yas/load-direory "~/.emacs.d/snippets")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("68769179097d800e415631967544f8b2001dae07972939446e21438b1010748c" default)))
 '(safe-local-variable-values (quote ((todo-categories "To do" "Todo") (todo-categories "Todo") (whitespace-line-column . 80) (lexical-binding . t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(ido-mode 1)
(menu-bar-mode 0)
