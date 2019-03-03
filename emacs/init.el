;;; package --- Personal setup

;;; Commentary:

;;; Code:

(package-initialize)

(eval-when-compile (require 'cl))

(require 'secrets "~/.emacs.d/secrets.el")
(require 'configs "~/.emacs.d/configs.el")

(do-config 'basic)
;; Operating system specific config
(do-config system-type)

(require 'packages "~/.emacs.d/packages.el")

(do-config 'prettify-symbols)
;;(do-config 'keybindings)
(do-config 'theme)
(do-config 'org-mode)
(do-config 'latex-mode)
(do-config 'markdown-mode)

;; (load "/home/kuro/bin/PG/generic/proof-site")

(provide 'init)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (flatui-theme flycheck-ledger yaml-mode which-key web-mode vala-mode use-package tide tabbar sublimity sass-mode rvm rust-mode robe rebecca-theme rainbow-delimiters projectile org-wiki neotree minimap meson-mode markdown-mode ledger-mode jinja2-mode haskell-mode groovy-mode gradle-mode go-mode github-modern-theme general evil erlang elixir-mode dockerfile-mode dashboard counsel company coffee-mode avy atom-one-dark-theme all-the-icons))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
