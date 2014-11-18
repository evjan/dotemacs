(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	          '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; to setup tabs
(setq c-basic-indent 2)
(setq tab-width 2)
(setq indent-tabs-mode nil)

;; enable auto-complete-mode all the time
(require 'auto-complete)
(global-auto-complete-mode t)

(global-set-key (kbd "C-x p") 'helm-git-files)
(global-set-key (kbd "C-x t") 'helm-git-grep)
;; (global-set-key (kbd "C-c a") 'rspec-verify-all)
;; (global-set-key (kbd "C-c s") 'rspec-verify)

(global-set-key (kbd "C-x w") 'mark-word)
;; (global-set-key (kbd "C-x m") 'mc/mark-all-like-this)

;;(add-to-list 'auto-mode-alist '("\\.ss\\'" . php-mode))
;;(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))

(setq auto-mode-alist (cons '("\\.html.erb$" . web-mode) auto-mode-alist))
;;(load-theme 'monokai t)

(ido-mode 1)
(menu-bar-mode 0)
(hl-line-mode 1)
(setq scss-compile-at-save nil)

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
