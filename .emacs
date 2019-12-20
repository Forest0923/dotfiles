;;; package
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;;; customise
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(global-display-line-numbers-mode t)
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#3a81c3")
     ("OKAY" . "#3a81c3")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#42ae2c")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f"))))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (haskell-mode spaceline-config js2-mode use-package spaceline-all-the-icons spacemacs-theme smartparens expand-region multiple-cursors rainbow-delimiters volatile-highlights hlinum move-text markdown-mode anzu company)))
 '(pdf-view-midnight-colors (quote ("#655370" . "#fbf8ef"))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; beep
(setq ring-bell-function 'ignore)

;; indent
(setq-default indent-tabs-mode nil)

;;; auto-save
;; backup-files
(setq make-backup-files nil)
;; auto-save-dir
(setq auto-save-file-name-transforms '((".*" "~/.emacs_autosave/" t)))

;; yes -> y, no -> n
(fset 'yes-or-no-p 'y-or-n-p)

;; font
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
                  (cons "Ricty Diminished Discord" "iso10646-1"))

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

;; ;; theme & color
;; ;; mode-line
;; (use-package spaceline-config
;;   :config
;;   (spaceline-spacemacs-theme))

;; ;; rainbow
;; (use-package rainbow-delimiters
;;   :ensure t
;;   :config
;;   (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))
