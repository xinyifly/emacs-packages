(defun plantuml-page-preview (prefix)
  (interactive "p")
  (save-excursion
    (plantuml-page-select)
    (plantuml-preview prefix)
    (deactivate-mark)))
(defun plantuml-page-next ()
  (interactive) (re-search-forward "\\(newpage\\|@enduml\\)" nil 1))
(defun plantuml-page-previous ()
  (interactive) (re-search-backward "\\(newpage\\|@startuml\\)" nil 1))
(defun plantuml-page-select ()
  (when (plantuml-page-previous) (goto-char (match-end 0)))
  (set-mark-command nil)
  (when (plantuml-page-next) (goto-char (match-beginning 0))))

(eval-after-load 'plantuml-mode
  (lambda ()
    (define-key plantuml-mode-map (kbd "C-c C-c") 'plantuml-page-preview)
    (define-key plantuml-mode-map (kbd "C-c C-n") 'plantuml-page-next)
    (define-key plantuml-mode-map (kbd "C-c C-p") 'plantuml-page-previous)))

(provide 'plantuml-page)
