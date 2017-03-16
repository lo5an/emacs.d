;; allow erase-buffere command
(put 'erase-buffer 'disabled nil)

;; uniquify buffer names
(require 'uniquify) ; bundled with GNU emacs 23.2.1 or before. On in 24.4
(setq uniquify-buffer-name-style 'post-forward-angle-brackets) ; emacs 24.4 style ⁖ cat.png<dirName

;; show matching pairs of parentheses and other characters
(show-paren-mode 1)


;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
 '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
 '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))
;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

;; CUA Mode copy
(cua-mode)

;; normal undo as well as the emacs one
(global-set-key "\C-z" 'undo)

;; hilight selected region
(transient-mark-mode 1)


;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)


; basic tab behavior 
;; stolen from http://www.jwz.org/doc/tabs-vs-spaces.html

(setq c-basic-offset 4)
(setq tab-width 4)
(setq indent-tabs-mode nil)

;;http://www.masteringemacs.org/articles/2011/10/02/improving-performance-emacs-display-engine/

;; fully redraw the display before processing queued input events. 
(setq redisplay-dont-pause t)

;; auto complete with tab 
(setq tab-always-indent 'complete)


;; on to the visual settings
(setq inhibit-splash-screen t)		; no splash screen, thanks
(line-number-mode 1)			; have line numbers and
(column-number-mode 1)			; column numbers in the mode line

(tool-bar-mode -1)			; no tool bar with icons
(scroll-bar-mode -1)			; no scroll bars


;; Use the clipboard, pretty please, so that copy/paste "works"
(setq x-select-enable-clipboard t)


;; whenever an external process changes a file underneath emacs, and there
;; was no unsaved changes in the corresponding buffer, just revert its
;; content to reflect what's on-disk.
(global-auto-revert-mode 1)


;; use ido 
(require 'ido)
(ido-mode t)
(ido-everywhere t)
(setq ido-save-directory-list-file "~/.emacs.d/.ido.last")
(setq ido-enable-flex-matching t)
(setq ido-show-dot-for-dired t)
(setq ido-default-buffer-method 'selected-window)

(global-set-key (kbd "C-x B") 'ibuffer)



;; hide the File  Edit Options menu in terminal mode
(unless (display-graphic-p)
   (menu-bar-mode -1))
