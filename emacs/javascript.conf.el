;;; javascript.el --- settings for modern javascript environment
;;
;;; Commentary:
;; This file is aimed at creating a great development environment for js/jsx/es6 and react
;; It uses a combination of webmode/js2 and tern to enable the majority of the features

;;; CODE:

(require 'auto-complete)
(require 'flycheck)
(require 'web-mode)
(require 'tern)
(require 'tern-auto-complete)
(require 'flycheck)

;; Turn auto-complete on for webmode
(add-to-list 'ac-modes 'web-mode)

;; JSX enable for js mode
(add-to-list 'auto-mode-alist
             '(".*\\.js[x]?" . web-mode))

;; hack to shut up the linter about web-mode-content-types-alist
(eval-when-compile
  (defvar web-mode-content-types-alist))

(setq web-mode-content-types-alist
      '(("jsx"  . ".*\\.js[x]?")))

(setq web-mode-enable-auto-pairing t)

(setq web-mode-enable-current-column-highlight t)
(setq web-mode-enable-current-element-highlight t)

(defun my-web-mode-hook ()
  "Hooks for Web mode. Adjust indents"
    ;;; http://web-mode.org/
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4))
(add-hook 'web-mode-hook  'my-web-mode-hook)

;; Enable jsx tweaks
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  "This function enables the jsx mode tweak."
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
	ad-do-it)
    ad-do-it))


;; ---- Flycheck ----
;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
	      (append flycheck-disabled-checkers
		          '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
	      (append flycheck-disabled-checkers
		          '(json-jsonlist)))
(add-hook 'after-init-hook 'global-flycheck-mode)


;; ---- Auto Complete ----
(setq web-mode-ac-sources-alist
      '(("css" . (ac-source-css-property))
        ("html" . (ac-source-words-in-buffer ac-source-abbrev))))

;; add the tern hook to web mode
(add-hook 'web-mode-hook (lambda() (tern-mode t)))
(add-hook 'js2-mode-hook (lambda() (tern-mode t)))

;; Load tern autocomplete when tern is loaded
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))

(defun delete-tern-process ()
  "Kill the tern process."
  (interactive)
    (delete-process "Tern"))


(provide 'javascript)
;;; javascript.el ends here
