;;  _       _ _         _
;; (_)_ __ (_) |_   ___| |
;; | | '_ \| | __| / _ \ |
;; | | | | | | |_ |  __/ |
;; |_|_| |_|_|\__(_)___|_|

;;; init.el --- Minimal modern completion setup -*- lexical-binding: t; -*-

;; 0. Stop startup message
(setq inhibit-startup-message t)

;; 1. Package archives & built-in use-package
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'use-package)
(setq use-package-always-ensure t)

;; 2. Core minibuffer & history quality-of-life
(use-package emacs
  :ensure nil
  :custom
  (enable-recursive-minibuffers t)
  (read-extended-command-predicate #'command-completion-default-include-p)
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt)))

(use-package savehist
  :ensure nil
  :init
  (savehist-mode 1))

;; 3. Vertico: clean vertical completion UI
(use-package vertico
  :init
  (vertico-mode 1))

;; 4. Orderless: space-separated, out-of-order matching
(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

;; 5. Marginalia: docstrings & metadata beside candidates
(use-package marginalia
  :init
  (marginalia-mode 1))

;; 6. Consult: search, buffer switching, and navigation commands
(use-package consult
  :bind (;; Buffer & file/line navigation
         ("C-x b" . consult-buffer)
         ("C-s"   . consult-line)
         ;; M-g goto-map bindings
         ("M-g g" . consult-goto-line)
         ("M-g M-g" . consult-goto-line)
         ("M-g o" . consult-outline)
         ("M-g i" . consult-imenu)
         ;; M-s search-map bindings
         ("M-s r" . consult-ripgrep)
         ("M-s f" . consult-find)
         ("M-s l" . consult-line-multi)))

;; 7. Which-key
(use-package which-key
  :ensure nil :init (which-key-mode 1))

;; 8. Put some space around the text
(set-fringe-mode 10)

;; 9. Load theme
(load-theme 'manoj-dark)

;; 10. markdown-mode
(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" . markdown-mode)
  :init (setq markdown-command "pandoc")) ; Or "multimarkdown" / "markdown"

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
