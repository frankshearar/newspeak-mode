;;;###autoload
(define-generic-mode newspeak-mode
  '(("\"" . "\""))
  '("self" "super" "outer" "true" "false" "nil" "thisContext")
  nil ; font-lock
  '("\\.ns$") ; auto-mode-alist
  nil ; function-list
  "A major mode for editing Newspeak.")