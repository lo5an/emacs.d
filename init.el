;; Package.el setup
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
	("marmalade" . "https://marmalade-repo.org/packages/")
	("gnu" . "http://elpa.gnu.org/packages/")))

;; Run this line if there's a problem with installing packages. 
;; (package-refresh-contents)

;; common lisp goodies, loop
(require 'cl)

;; el-get package manager
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(setq  el-get-user-package-directory  "~/.emacs.d/el-get-config")


;; elpa packages that don't have el-get recipes
(el-get-bundle drupal-mode :type elpa)

;; el-get packages
(setq my-packages '(
		    auto-complete
		    color-theme-solarized
		    dash
		    el-get
		    smex
		    switch-window
		    yaml-mode
		    ))
(el-get 'sync my-packages)

;; do elpa junk
(package-initialize)

;; Put menu customizations in their own file
(setq custom-file "~/.emacs.d/custom.el")

;; load my other settings
(load  "~/.emacs.d/lmc.el" 'no-error)
