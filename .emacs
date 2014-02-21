(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
         '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; Create kbd macro to correct indentation in entire buffer
(fset 'indent-buffer
   "\C-xh\234")

;; to setup tabs
(setq c-basic-indent 2)
(setq tab-width 4)
(setq indent-tabs-mode nil)

;; enable auto-complete-mode all the time
(require 'auto-complete)
(global-auto-complete-mode t)

(global-set-key (kbd "C-x p") 'helm-git-files)
(global-set-key (kbd "C-x t") 'helm-git-grep)
(global-set-key (kbd "C-c a") 'rspec-verify-all)
(global-set-key (kbd "C-c c") 'rspec-verify)

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

;;;  This is my re-rwrite of Jonas Jarnestrom's refreshing logic
;;;  that puts the TAGS file in the git project root directory
;;;
;;;  The original:
;;;  Jonas.Jarnestrom<at>ki.ericsson.se A smarter
;;;  find-tag that automagically reruns etags when it cant find a
;;;  requested item and then makes a new try to locate it.
;;;  Fri Mar 15 09:52:14 2002

(defadvice find-tag (around refresh-etags activate)
   "Rerun etags and reload tags if tag not found and redo find-tag.
   If buffer is modified, ask about save before running etags."
  (let ((extension (file-name-extension (buffer-file-name))))
    (condition-case err
    ad-do-it
      (error (and (buffer-modified-p)
          (not (ding))
          (y-or-n-p "Buffer is modified, save it? ")
          (save-buffer))
         (er-refresh-etags extension)
         ad-do-it))))

(defun er-refresh-etags (&optional extension)
  "Run etags on all peer files in current dir and reload them silently."
  (let ((project-directory (locate-dominating-file default-directory ".git")))
    (interactive)
    (shell-command (format "cd %s && ctags -e -R %s" project-directory project-directory))
    (let ((tags-revert-without-query t))  ; don't query, revert silently
      (visit-tags-table project-directory nil))))
