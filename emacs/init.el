;;; init.el --- Beauzeaux emacs.d
;;
;;; Commentary:
;;; 

;;; CODE: 
(load "~/.emacs.d/load-directory")
(require 'linum)
 
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

;; Turn off the tabs
(setq-default indent-tabs-mode nil)

;; Turn off menu bar
(menu-bar-mode -1)

;; Turn off toolbar
(tool-bar-mode -1)

;; Turn off scroll bar
(scroll-bar-mode -1)

;; Turn on linum mode
(global-linum-mode 1)
(setq linum-format "%4d \u2502 ")

;; Don't litter fs
(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.saves"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
    version-control t)       ; use versioned backups


(add-hook 'markdown-mode-hook 'turn-on-orgtbl)

(defun delete-tern-process ()
  (interactive)
    (delete-process "Tern"))

;; MAGIT stuff
(global-set-key (kbd "C-x g") 'magit-status)

(set-frame-parameter nil 'background-mode 'dark)
(load-theme 'solarized t)


(load-directory "~/.emacs.d/load.d")

(provide 'init)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
