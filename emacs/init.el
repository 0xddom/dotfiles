;;; package --- Personal setup

;;; Commentary:

;;; Code:

(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t )		; make backups file even when in version controlled dir
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")) ) ; which directory to put backups file
(setq vc-follow-symlinks t)		; don't ask for confirmation when opening symlinked file
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
(scroll-bar-mode -1) ; Remove scrollbar
(put 'downcase-region 'disabled nil)
(put 'uppercase-region 'disables nil)
;; (set-face-attribute 'default nil :height 100)
(set-frame-font "Source Code Pro for Powerline Light 13")
(global-unset-key (kbd "C-z"))

(setq frame-title-format
          '(buffer-file-name "%f - Emacs"
            ))

(defun set-font-size ()
  "Set a default font size and style."
  (set-frame-font "Monaco 14")
)

					; OSX specific config

(defun is-os-x ()
  "Return whenever this Emacs is on OSX."
  (string-equal system-type "darwin"))

(defun set-os-x-config ()
  "Set specific OSX variables and configurations."
  (setq mac-option-key-is-meta t)
  (setq mac-right-option-modifier nil)
  (menu-bar-mode 1)
  )

(when (is-os-x)
  (set-os-x-config))

(setq tab-width 2)
(setq-default cursor-type 'bar)
(global-linum-mode 1)

(require 'package)
(require 'cl)

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
 "C--" 'text-scale-decrease
 "C-+" 'text-scale-increase
 "C-0" '(set-face-attribute 'default nil :height 100)
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

(use-package all-the-icons :ensure t)

(use-package neotree :ensure t
  :config
  (global-set-key [f8] 'neotree-toggle)
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))

;;(use-package minimap :ensure t
;;  :config
;;  (custom-set-variables
;;   '(minimap-hide-scroll-bar t)
;;   '(minimap-width-fraction 0.1)
;;   '(minimap-window-location (quote right)))
;;  (custom-set-faces
;;   '(minimap-font-face ((t (:height 20 :family "DejaVu Sans Mono")))))
;;  (global-set-key [f7] 'minimap-create))

(use-package dashboard :ensure t
  :config
  (dashboard-setup-startup-hook))

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

(use-package rvm :ensure t
  :config
  (rvm-use-default))

(use-package robe :ensure t
  :config
  (add-hook 'ruby-mode-hook 'robe-mode))

(use-package sublimity :ensure t
  :config
  ;;(require 'sublimity-scroll)
  ;;(require 'sublimity-map)

  ;;(sublimity-mode 1)

  ;;(sublimity-map-set-delay nil)
  
  ;; (setq sublimity-scroll-weight 5
  ;;	sublimity-scroll-drift-length 10)
  )

					; Theme setup
(use-package rebecca-theme :ensure t
  :config
  (load-theme 'rebecca t))




					; Org-mode setup

(defun config-org-mode ()
  "Org-mode configuration encapsulated."
  (setq org-directory "~/Dropbox/org")
  (setq org-mobile-inbox-for-pull "~/Dropbox/org/notes.org")
  (setq org-mobile-directory "~/Dropbox/Aplicaciones/MobileOrg")

  (setq org-mobile-autopull nil)
  (when org-mobile-autopull
    (org-mobile-pull))
  

  (add-hook 'org-mode-hook #'(lambda ()
			       (visual-line-mode)
			(variable-pitch-mode)
			       (org-indent-mode)))

  (require 'org-wiki)
  (setq org-wiki-location "~/org/wiki")
  )

(config-org-mode)

					; Markdown setup
(add-hook 'markdown-mode-hook #'(lambda ()
				  (visual-line-mode)
				  (variable-pitch-mode)))
					; Language modes

(use-package ruby-mode :ensure t
  :mode "\\.rb\\'"
  :interpreter "ruby")

(use-package python :ensure t
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode))

(use-package ledger-mode :ensure t
  :mode "\\.dat\\'"
  :config
  (general-define-key "C-c s" 'ledger-sort-buffer)
  )

(use-package vala-mode :ensure t
  :mode "\\.vala\\'")

(use-package yaml-mode :ensure t
  :mode "\\.yml\\'")

(use-package coffee-mode :ensure t
  :mode "\\.coffee\\'")

(use-package web-mode :ensure t
  :mode "\\.\\(erb\\|php\\)\\'")

(use-package markdown-mode :ensure t
  :mode "\\.md\\'")

(use-package rust-mode :ensure t
  :mode "\\.rs\\'")

(use-package typescript-mode :ensure t
  :mode "\\.ts\\'")

(use-package dockerfile-mode :ensure t
  :mode "Dockerfile")

(use-package tide :ensure t
  :config
  (setq company-tooltip-align-annotations t)
  (add-hook 'before-save-hook  'tide-format-before-save)
  (add-hook 'typescript-mode-hook #'setup-tide-mode)
  (setq tide-format-options '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t :placeOpenBraceOnNewLineForFunctions nil)))

(use-package jinja2-mode :ensure t
  :mode "\\.j2\\'")

(use-package dockerfile-mode :ensure t
  :mode "Dockerfile")

(use-package haskell-mode :ensure t
  :mode "\\.hs\\'")

(use-package haskell-mode :ensure t
  :mode "\\.hs\\'")

(use-package sass-mode :ensure t
  :mode "\\.scss\\'")

(use-package go-mode :ensure t
  :mode "\\.go\\'")

(use-package gradle-mode :ensure t
  :mode "\\.gradle\\'")

(use-package groovy-mode :ensure t
  :mode "\\.\\(gradle\\|groovy\\)\\'")

(provide 'init)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minimap-hide-scroll-bar t)
 '(minimap-width-fraction 0.1)
 '(minimap-window-location (quote right))
 '(package-selected-packages
   (quote
    (sublimity rvm robe robe-mode dashboard rebecca-theme rebeca-theme all-the-icons sass-mode haskell-mode tide typescript-mode rust-mode markdown-mode web-mode coffee-mode yaml-mode vala-mode ledger-mode atom-one-dark-theme flycheck company minimap neotree which-key counsel swiper ivy general avy use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minimap-font-face ((t (:height 20 :family "DejaVu Sans Mono")))))

;; Remove annoying warnings.

;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
