;;; package -- Third party packages configuration

;;; Commentary:
;;; Configuration of third party packages

;;; Code:

(require 'package)
(do-config 'use-package)
(require 'use-package)

(use-package avy :ensure t :commands (avy-goto-word-1))
(use-package general :ensure t :config (do-config 'general-mode))
(use-package tabbar :ensure t)
(use-package ivy :ensure t)
(use-package swiper :ensure t :commands (swiper))
(use-package counsel :ensure t :commands (counsel-M-x))
(use-package which-key :ensure t :config (do-config 'which-key-mode))
(use-package projectile :ensure t :config (do-config 'projectile-mode))
(use-package all-the-icons :ensure t)
(use-package neotree :ensure t :config (do-config 'neotree-mode))
(use-package rainbow-delimiters :ensure t :config (do-config 'rainbow-delimiters-mode))
(use-package company :ensure t :init (do-config 'company-mode))
(use-package flycheck :ensure t :init (do-config 'flycheck-mode))
(use-package rvm :ensure t :config (do-config 'rvm-mode))
(use-package robe :ensure t :config (do-config 'robe-mode))
(use-package sublimity :ensure t :config (do-config 'sublimity-mode))
(use-package ruby-mode :ensure t :mode "\\.rb\\'" :interpreter "ruby" :config (do-config 'ruby-mode))
;;(use-package python :ensure t :mode ("\\.py\\'" . python-mode) :interpreter ("python" . python-mode))
(use-package ledger-mode :ensure t :mode "\\.dat\\'" :config (do-config 'ledger-mode))
(use-package flycheck-ledger :ensure t :config (do-config 'flycheck-ledger))
(use-package vala-mode :ensure t :mode "\\.vala\\'")
(use-package yaml-mode :ensure t :mode "\\.yml\\'")
;;(use-package coffee-mode :ensure t :mode "\\.coffee\\'")
;;(use-package web-mode :ensure t :mode "\\.\\(erb\\|php\\)\\'")
;;(use-package markdown-mode :ensure t :mode "\\.md\\'")
(use-package rust-mode :ensure t :mode "\\.rs\\'")
;;(use-package typescript-mode :ensure t :mode "\\.ts\\'")
(use-package dockerfile-mode :ensure t :mode "Dockerfile")
;;(use-package jinja2-mode :ensure t :mode "\\.j2\\'")
(use-package haskell-mode :ensure t :mode "\\.hs\\'" :config (do-config 'haskell-mode))
(use-package sass-mode :ensure t :mode "\\.scss\\'")
;;(use-package go-mode :ensure t :mode "\\.go\\'")
;;(use-package gradle-mode :ensure t :mode "\\.gradle\\'")
;;(use-package groovy-mode :ensure t :mode "\\.\\(gradle\\|groovy\\)\\'")
(use-package meson-mode :ensure t :mode "\\.build\\'")
;;(use-package dashboard :ensure t :config (do-config 'dashboard-mode))

(provide 'packages)

;;; packages.el ends here
