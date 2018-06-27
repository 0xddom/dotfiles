;;; package --- Configuration functions

;;; Commentary:
;;; This functions implements various configurations.
;;; To call a config run (do-config 'name)

;;; Code:

(require 'solar)
(require 'calendar)

(defun set-font-size (size)
  "Set a default font size and style.
SIZE: The size of the font"
  (set-frame-font (format "Source Code Pro for Powerline Light %d" size))
  )

(defun night-time? (time)
  "Return true if we are at night time, false otherwise.
TIME: The current time."
  (or
   (< time sunrise-time)
   (> time sunset-time)))

(defun configs//basic ()
  "Run the basic configuration."
  (setq delete-old-versions -1)
  (setq version-control t)
  ;; Make backups file even when in version controlled dir
  (setq vc-make-backup-files nil)
  ;; Which directory to put backups file
  (setq backup-directory-alist `(("." . "~/.emacs.d/backups")) )
  ;; Don't ask for confirmation when opening symlinked file
  (setq vc-follow-symlinks t)
  ;; Transform backups file name
  (setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))
  ;; Inhibit useless and old-school startup screen
  (setq inhibit-startup-screen t)
  ;; Silent bell when you make a mistake
  (setq ring-bell-function 'ignore)
  ;; Use utf-8 by default
  (setq coding-system-for-read 'utf-8)
  (setq coding-system-for-write 'utf-8)
  ;; Sentence SHOULD end with only a point.
  (setq sentence-end-double-space nil)
  ;; Toggle wrapping text at the 80th character
  (setq fill-column 80)
  (setq initial-scratch-message "")
  ;; Remove toolbar
  (tool-bar-mode -1)
  ;; Remove menubar
  (menu-bar-mode -1)
  ;; Remove scrollbar
  (scroll-bar-mode -1)
  (put 'downcase-region 'disabled nil)
  (put 'uppercase-region 'disables nil)
  (global-unset-key (kbd "C-z"))
  (setq frame-title-format '(buffer-file-name "%f - Emacs"))
  (set-font-size 10)
  (setq tab-width 2)
  (setq-default cursor-type 'bar)
  (global-linum-mode 1)
  ;; (setq line-move-visual nil)
  (add-hook 'text-mode-hook 'turn-on-visual-line-mode)
 
  (setq sunset-time (caadr (solar-sunrise-sunset (calendar-current-date)))) ;; sunset
  (setq sunrise-time (caar (solar-sunrise-sunset (calendar-current-date)))) ;; sunrise
  )

(defun configs//darwin ()
  "Set specific macOS variables and configurations."
  (setq mac-option-key-is-meta t)
  (setq mac-right-option-modifier nil)
  (menu-bar-mode 1)
  (set-font-size 13)
  )

(defun configs//gnu/linux ()
  "Set specific GNU/Linux variables and configurations."
  )

(defun configs//use-package ()
  "Set the configuration for \"use-package\" and install it if needed."
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
  )

(defun configs//prettify-symbols ()
  "Encapsulates prettify symbols setup."
  (setq prettify-symbols-alist
	'(
	  ("lambda" . 955) ; λ
	  ("->" . 8594)    ; →
	  ("=>" . 8658)    ; ⇒
	  ("map" . 8614)   ; ↦
	  ("<=" . 2264)    ; ≤
	  (">=" . 2265)    ; ≥
	  ))
  (global-prettify-symbols-mode 1)
  )

(defun configs//keybindings ()
  "Set custom keybindings."
  (general-define-key
   ;; Replace default keybindings
   "C-s" 'swiper         ; Search for string in current buffer
   "M-x" 'counsel-M-x    ; Replace default M-x with ivy backend
   "C--" 'text-scale-decrease
   "C-+" 'text-scale-increase
   ;; "C-0" '(set-font-size font-size)
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
  (general-define-key "C-'" 'avy-goto-word-1)
  )

(defun load-theme-dinamically ()
  "Load a dark or light theme depending of the current time."
  (message "Setting the theme")
  ;; (pcase dinamically-set-theme
  ;;   [nil (setq
  ;; 	  (if (night-time? (string-to-number (format-time-string "%H")))
  ;; 	      'rebecca
  ;; 	    'flatui))]
  ;;   ['
  ;;    (load-theme #'flatui t))
  ;; (setq theme-changed? nil)
  ;; (let [is-night-time? (night-time? (string-to-number (format-time-string "%H")))]
  ;;   (cond
  ;;    [(nilp dinamically-set-theme)
  ;;     (setq theme-changed? t)
  ;;     (setq dinamically-set-theme
  ;; 	    (if is-night-time? current-hour)]
  ;;    [(night-time? current-hour)
  ;;     ()]
  ;;    [(not (night-time? current-hour))
  ;;     ()]))
  ;; (when theme-changed?
  ;;   (load-theme dinamically-set-theme t))
  (load-theme 'rebecca t))
    

(defun configs//theme ()
  "Setup the theme."
  (unless (package-installed-p 'flatui-theme)
    (package-refresh-contents)
    (package-install 'flatui-theme))
  (setq dinamically-set-theme nil)
  (setq dark-theme 'rebecca)
  (setq light-theme 'flatui)
  (load-theme-dinamically)
  ;(* 60 30)
  ;(run-at-time t 1 'load-theme-dinamically)
  )

(defun configs//org-mode ()
  "\"org-mode\" configuration encapsulated."
  (setq org-directory "~/org")
  ;; (setq org-mobile-inbox-for-pull "~/Dropbox/org/notes.org")
  ;; (setq org-mobile-directory "~/Dropbox/Aplicaciones/MobileOrg")
  
  ;; (setq org-mobile-autopull nil)
  ;; (when org-mobile-autopull
  ;;   (org-mobile-pull))
  
  
  (add-hook 'org-mode-hook (lambda ()
			     (visual-line-mode)
			     (org-indent-mode)))
  
  (require 'org-wiki)
  (setq org-wiki-location "~/org/wiki")
  )

(defun configs//latex-mode ()
  "\"LaTeX-mode\" configuration encapsulated."
  ;; (add-hook 'LaTeX-mode-hook 'turn-on-visual-line-mode)
  )

(defun configs//markdown-mode ()
  "\"markdown-mode\" configuration encapsulated."
  (add-hook 'markdown-mode-hook (lambda ()
				  (visual-line-mode)
				  ))
  )

(defun configs//general-mode ()
  "\"general-mode\" configuration."
  (do-config 'keybindings)
  )

(defun configs//which-key-mode ()
  "\"which-key-mode\" configuration."
  (which-key-mode)
  (which-key-add-key-based-replacements
    "C-c f" "file"
    "C-c ff" "find file"
    "C-c fr" "recently edited"
    "C-c p" "project"))

(defun configs//projectile-mode ()
  "\"projectile-mode\" configuration."
  (projectile-mode))

(defun configs//neotree-mode ()
  "\"neo-tree-mode\" configuration."
  (global-set-key [f8] 'neotree-toggle)
  ;;(setq neo-theme (if (or (display-graphic-p) (server-running-p)) 'icons 'arrow)))
  (setq neo-theme 'icons))

(defun configs//rainbow-delimiters-mode ()
  "\"rainbow-delimiters-mode\" configuration."
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(defun configs//company-mode ()
  "\"company-mode\" configuration."
  (add-hook 'after-init-hook 'global-company-mode))

(defun configs//flycheck-mode ()
  "\"flycheck-mode\" configuration."
  (global-flycheck-mode))

(defun configs//rvm-mode ()
  "\"rvm-mode\" configuration."
  (rvm-use-default))

(defun configs//robe-mode ()
  "\"robe-mode\" configuration."
  (add-hook 'ruby-mode-hook 'robe-mode))

(defun configs//sublimity-mode ()
  "\"sublimity-mode\" configuration."
  ;;(require 'sublimity-scroll)
  ;;(require 'sublimity-map)
  
  ;;(sublimity-mode 1)
  
  ;;(sublimity-map-set-delay nil)
  
  ;; (setq sublimity-scroll-weight 5
  ;;	sublimity-scroll-drift-length 10)
  )

(defun configs//ruby-mode ()
  "\"ruby-mode\" configuration."
  (add-hook 'ruby-mode-hook #'(lambda ()
  				(setq prettify-symbols-alist
  				      '(
  					("lambda" . 955) ; λ
  					("->" . 8594)    ; →
					)
  				      ))))

(defun configs//ledger-mode ()
  "\"ledger-mode\" configuration."
  (general-define-key "C-c s" 'ledger-sort-buffer))

(defun configs//flycheck-ledger ()
  "\"flycheck-ledger-mode\" configuration."
  (eval-after-load 'flycheck
    '(require 'flycheck-ledger)))

(defun configs//haskell-mode ()
  "\"haskell-mode\" configuration."
  (add-hook 'haskell-mode-hook #'(lambda ()
				   (setq prettify-symbols-alist
					 '(
					   ("lambda" . 955) ; λ
					   ("map" . 8614)   ; ↦
					   ("->" . 8594)    ; →
					   ("sum" . 8721) ; ∑
					   ("foldr (*) 1" . 8719) ; ∏
					   )
					 ))))

(defun configs//dashboard-mode ()
  "\"dashboard-mode\" configuration."
  (dashboard-setup-startup-hook))

					; do-config

(defun do-config (name)
  "Run the config function defined by NAME.
NAME: The config atom that references the config function."
  (funcall (intern (format "configs//%s" name)))
  )

(provide 'configs)

;;; configs.el ends here
