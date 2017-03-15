;;; package --- Personal setup

;;; Commentary:

;;; Code:

(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t )		; make backups file even when in version controlled dir
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")) ) ; which directory to put backups file
(setq vc-follow-symlinks t )		; don't ask for confirmation when opening symlinked file
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)) ) ;transform backups file name
(setq inhibit-startup-screen t )	; inhibit useless and old-school startup screen
(setq ring-bell-function 'ignore )	; silent bell when you make a mistake
(setq coding-system-for-read 'utf-8 )	; use utf-8 by default
(setq coding-system-for-write 'utf-8 )
(setq sentence-end-double-space nil)	; sentence SHOULD end with only a point.
(setq fill-column 80)		; toggle wrapping text at the 80th character
(setq initial-scratch-message "Welcome in Emacs")
(tool-bar-mode -1) ; Remove toolbar
(menu-bar-mode -1) ; Remove menubar

(setq tab-width 2)
(setq-default cursor-type 'bar)
(global-linum-mode 1)

(require 'package)
;(require 'cl)

(setq package-enable-at-startup nil)

(setq package-archives '(("org"         . "http://orgmode.org/elpa/")
			 ("gnu"         . "http://elpa.gnu.org/packages/")
			 ("melpa"       . "http://melpa.org/packages/")
			 ("marmalade"   . "http://marmalade-repo.org/packages/")
			 ))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(use-package avy :ensure t
  :commands (avy-goto-word-1))

(use-package general :ensure t
  :config
  (general-define-key "C-'" 'avy-goto-word-1)
  )

(use-package ivy :ensure t)

(use-package swiper :ensure t
  :commands (swiper))

(use-package counsel :ensure t
  :commands (counsel-M-x))

(use-package which-key :ensure t
  :config
  (which-key-mode)
  (which-key-add-key-based-replacements
   "C-c f" "file"
   "C-c ff" "find file"
   "C-c fr" "recently edited"
   "C-c p" "project"))

(general-define-key
 ;; Replace default keybindings
 "C-s" 'swiper         ; Search for string in current buffer
 "M-x" 'counsel-M-x    ; Replace default M-x with ivy backend
 )

(general-define-key
 :prefix "C-c"
 "b" 'ivy-switch-buffer
 "/" 'counsel-git-grep

 "f"  '(:ignore t :which-key "files")
 "ff" 'counsel-find-file
 "fr" 'counsel-recentf
 "p"  '(:ignore t :which-key "project")
 "pf" '(counsel-git :which-key "find file in git dir")
 )

(use-package neotree :ensure t
  :config
  (global-set-key [f8] 'neotree-toggle))

(use-package minimap :ensure t
  :config
  (custom-set-variables
   '(minimap-hide-scroll-bar t)
   '(minimap-width-fraction 0.1)
   '(minimap-window-location (quote right)))
  (custom-set-faces
   '(minimap-font-face ((t (:height 20 :family "DejaVu Sans Mono")))))
  (global-set-key [f7] 'minimap-create))

(use-package company :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(use-package flycheck :ensure t
  :init
  (global-flycheck-mode))

(defun setup-tide-mode ()
  "Set how tide mode will behave."
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

					; Theme setup
(use-package atom-one-dark-theme :ensure t
  :config
  (load-theme 'atom-one-dark t))

					; Language modes

(use-package ruby-mode :ensure t
  :mode "\\.rb\\'"
  :interpreter "ruby")

(use-package python :ensure t
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode))

(use-package ledger-mode :ensure t
  :mode "\\.dat\\'")

(use-package vala-mode :ensure t
  :mode "\\.vala\\'")

(use-package yaml-mode :ensure t
  :mode "\\.yml\\'")

(use-package coffee-mode :ensure t
  :mode "\\.coffee\\'")

(use-package web-mode :ensure t
  :mode "\\.erb\\'")

(use-package markdown-mode :ensure t
  :mode "\\.md\\'")

(use-package rust-mode :ensure t
  :mode "\\.rs\\'")

(use-package typescript-mode :ensure t
  :mode "\\.ts\\'")

(use-package tide :ensure t
  :config
  (setq company-tooltip-align-annotations t)
  (add-hook 'before-save-hook  'tide-format-before-save)
  (add-hook 'typescript-mode-hook #'setup-tide-mode)
  (setq tide-format-options '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t :placeOpenBraceOnNewLineForFunctions nil)))

(provide 'init)

;;; init.el ends here
