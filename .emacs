(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;; Stylishness
(load "~/.emacs.d/elpa/color-theme-molokai-0.1/color-theme-molokai.el")
(color-theme-molokai)
(set-face-attribute 'default nil :font "DejaVu Sans Mono-12")

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

;; find file in project, like Command-T in TextMate
(require 'find-file-in-project)
(global-set-key (kbd "C-x p") 'find-file-in-project)
(setq ffip-limit 10240)
