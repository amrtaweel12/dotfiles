;-------------------------------------------------------------------------------
; # Emacs Settings
;-------------------------------------------------------------------------------

;; Turn off splash screen
;; The scratch buffer will show on startup
(setq inhibit-startup-message t)

;; Disable scroll-bar
(scroll-bar-mode -1)
;; Disable the tool-bar
(tool-bar-mode -1)
;; Disable tooltips
(tooltip-mode -1)
;; Disable menu-bar
(menu-bar-mode -1)

;; Show column number in status line
(column-number-mode)
;; Show line numbers
(global-display-line-numbers-mode t)
;; Enable relative line numbers
(setq display-line-numbers-type 'relative)

;; Disable line numbers for some modes
(dolist (mode '(term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Enable the visible bell
(setq visible-bell t)

;; Disable line wrapping
(setq truncate-lines t)
