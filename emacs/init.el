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
