;;; package --- Personal setup

;;; Commentary:

;;; Code:


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(eval-when-compile (require 'cl))

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
