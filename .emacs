;;; package
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Theme
(load-theme 'spacemacs-dark t)

;; Display
(setq inhibit-startup-screen t)
(tool-bar-mode 0)
(menu-bar-mode 0)

;; Line Setting
(setq column-number-mode t)
(global-display-line-numbers-mode t)

;; Scroll
(setq scroll-step 1)
(setq scroll-margin 5)
(setq scroll-preserve-screen-position t)
;; (use-package smooth-scroll
;;   :ensure t
;;   :config
;;   (smooth-scroll-mode t))

;; yes -> y, no -> n
(fset 'yes-or-no-p 'y-or-n-p)

;; bell
(setq ring-bell-function 'ignore)

;; indent = space
(setq-default indent-tabs-mode nil)


;;; auto-save
;; backup-files
(setq make-backup-files nil)
;; auto-save-dir
(setq auto-save-file-name-transforms '((".*" "~/.emacs_autosave/" t)))


;; font
(if (display-graphic-p)
    (progn
      (set-face-attribute 'default nil
                          :family "Ricty Diminished Discord")
      (set-fontset-font (frame-parameter nil 'font)
                        'japanese-jisx0208
                        (cons "Ricty Diminished Discord" "iso10646-1"))
      (set-fontset-font (frame-parameter nil 'font)
                        'japanese-jisx0212
                        (cons "Ricty Diminished Discord" "iso10646-1"))
      (set-fontset-font (frame-parameter nil 'font)
                        'katakana-jisx0201
                        (cons "Ricty Diminished Discord" "iso10646-1")))
  )

;;; company
(use-package company
  :ensure t
  :config
  (global-company-mode)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2)
  (setq company-selection-wrap-around t))

;;; language
;; c/cpp
;; python
;; javascript
(add-hook 'js-mode-hook
	  (lambda ()
	    (make-local-variable 'js-indent-level)
	    (setq js-indent-level 2)))
;; html/css
;; markdown
(use-package markdown-mode
  :ensure t)
;; haskell
(use-package haskell-mode
  :ensure t)

;; prolog
(autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
(add-to-list 'auto-mode-alist '("\\.pl\\'" . prolog-mode))

;;; editor ui
;; hlinum
(use-package hlinum
  :ensure t
  :config
  (hlinum-activate))
;; anzu
(use-package anzu
  :ensure t
  :config
  (global-anzu-mode +1))
;; move-text
(use-package move-text
  :ensure t
  :config
  (move-text-default-bindings))
;; volatile-highlights
(use-package volatile-highlights
  :ensure t
  :config
  (volatile-highlights-mode))

;; ;; multiple-cursors
;; (use-package multiple-cursors
;;   :ensure t
;;   :bind("M-<mouse-1>" . mc/add-cursor-onclick))

;; expand-region
(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))
;; smartparens
(use-package smartparens
  :ensure t
  :config
  (smartparens-global-mode t))

