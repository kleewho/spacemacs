;;; packages.el --- Java functions File for Spacemacs
;;
;; Copyright (c) 2015 Lukasz Klich
;;
;; Author: Lukasz Klich <klich.lukasz@gmail.com>
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun spacemacs/java-completing-dot ()
  "Insert a period and show company completions."
  (interactive "*")
  (when (s-matches? (rx (+ (not space)))
                    (buffer-substring (line-beginning-position) (point)))
    (delete-horizontal-space t))
  (insert ".")
  (company-emacs-eclim 'interactive))

(defun spacemacs/java-completing-double-collon ()
  "Insert double collon and show company completions."
  (interactive "*")
  (when (s-matches? (rx (+ (not space)))
                    (buffer-substring (line-beginning-position) (point)))
    (delete-horizontal-space t))
  (insert ":")
  (let ((curr (point)))
  (when (s-matches? (buffer-substring (- curr 2) (- curr 1)) ":")
    (company-emacs-eclim 'interactive))))

(defun spacemacs/java-maybe-completing-on-tab ()
  "Either indents, expands or completes when tab is hitted."
  (interactive "*")
  )


(defun spacemacs/java-maven-test ()
  (interactive)
  (eclim-maven-run "test"))

(defun spacemacs/java-maven-clean-install ()
  (interactive)
  (eclim-maven-run "clean install"))

(defun spacemacs/java-maven-install ()
  (interactive)
  (eclim-maven-run "install"))
