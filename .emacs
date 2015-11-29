(setq custom-file "~/.emacs.d/custom-settings.el")
(load custom-file)

;;; Environement ;;;
(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(global-unset-key (kbd "C-z")) ; Remove sleep binding

; Indentation
(setq-default indent-tabs-mode nil)
(setq standard-indent 4)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'standard-indent)

; Save backup in specific dir
(setq make-backup-files t)
(setq version-control t)
(setq backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))

;;; Display ;;;
(setq inhibit-startup-message t)
(column-number-mode t)
(global-hl-line-mode 1)
(set-face-attribute 'default nil :height 100)

;;; Modules ;;;
; Perl
(add-to-list 'load-path "~/.emacs.d/perl")
(defalias 'perl-mode 'cperl-mode)
(require 'perlcritic)
(require 'flymake)
;;(add-to-list 'load-path "~/.emacs.d/perl/pde/Emacs-PDE-0.2.16/")
;;(load "pde-load")

; VBScript Mode
;;(require 'vbs-repl)
(add-to-list 'load-path "~/.emacs.d/visualBasic")
(require 'visual-basic-mode)
(setq auto-mode-alist
      (append '(("\\.\\(vbs\\|wsf\\)$" . vbscript-mode))
              auto-mode-alist))

; LaTeX
(setq TeX-PDF-mode t)
(setq LaTeX-item-indent 0)
(setq LaTeX-indent-level 4)
(setq TeX-newline-function 'newline-and-indent)
;; Doc: http://www.gnu.org/software/auctex/manual/auctex/Indenting.html

;; Spell check on the fly!
(setq ispell-program-name "aspell")
(setq ispell-dictionnary "french")
;(add-hook 'LaTeX-mode-hook 'flyspell-mode)
;(add-hook 'LaTeX-mode-hook 'flyspell-buffer)
;; Hide sections with C-c C-o C-l (See it with C-c C-o C-a)
(defun turn-on-outline-minor-mode()
  (outline-minor-mode 1))
(add-hook 'LaTeX-mode-hook 'turn-on-outline-minor-mode)
(add-hook 'latex-mode-hook 'turn-on-outline-minor-mode)
(setq outline-minor-mode-prefix "\C-c \C-e")

; PHP
(add-to-list 'load-path "~/.emacs.d/php")
(require 'php-mode)

; JSon
(defun json-format ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "python -m json.tool" (buffer-name) t)
    )
  )

; Markdown
(autoload 'markdown-mode "~/.emacs.d/markdown-mode.el"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
