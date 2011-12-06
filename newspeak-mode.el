(require 'font-lock)

(defvar newspeak-mode-syntax-table
  (let ((table (copy-syntax-table (standard-syntax-table))))
    (modify-syntax-entry ?\( ".1" table)
    (modify-syntax-entry ?\* ".23" table)
    (modify-syntax-entry ?\) ".4" table)
    (modify-syntax-entry ?\" "!" table)      ; "" style comment
    (modify-syntax-entry ?\( "()  " table)
    (modify-syntax-entry ?\) ")(  " table)
    (modify-syntax-entry ?\{ "(}  " table)
    (modify-syntax-entry ?\} "){  " table)
    (modify-syntax-entry ?\' "\"" table)     ; string literals
    (modify-syntax-entry ?\[ "(\]" table)    ; blocks
    (modify-syntax-entry ?\] ")\[" table)    ; blocks
    (modify-syntax-entry ?\. "." table)      ; statement separator
    (modify-syntax-entry ?\; "." table)      ; cascades
    (modify-syntax-entry ?^ "." table)       ; return
    table))

(defvar newspeak-keyword-face 'font-lock-keyword-face)
(defvar newspeak-message-face 'font-lock-keyword-face)

(defconst newspeak-mode-font-lock-keywords
  (let* ((reserved-word
          (concat "\\<"
		  ;;(regexp-opt '("false" "nil" "outer" "self" "super" "thisContext" "true"))
		  "\\(false\\|nil\\|outer\\|s\\(elf\\|uper\\)\\|t\\(hisContext\\|rue\\)\\)"
		  "\\>"))
         keywords)
    (setq keywords
          `((,reserved-word 1 (symbol-value 'newspeak-keyword-face))
	    keywords))))

(define-derived-mode newspeak-mode fundamental-mode "Newspeak"
  "A major mode for editing Newspeak."
  (set (make-local-variable 'indent-tabs-mode) nil)
  (set (make-local-variable 'tab-width) 8)
  (set (make-local-variable 'font-lock-defaults)
       '(newspeak-mode-font-lock-keywords)))