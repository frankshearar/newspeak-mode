(require 'font-lock)

(defvar newspeak-mode-syntax-table
  (let ((table (copy-syntax-table (standard-syntax-table))))
    (modify-syntax-entry ?\( "()1" table)
    (modify-syntax-entry ?\* ".23" table)
    (modify-syntax-entry ?\) ")(.4" table)
    (modify-syntax-entry ?\" "!b" table)     ; "" style comment
    (modify-syntax-entry ?\{ "(}  " table)
    (modify-syntax-entry ?\} "){  " table)
    (modify-syntax-entry ?\' "\"" table)     ; string literals
    (modify-syntax-entry ?\[ "(\]" table)    ; blocks
    (modify-syntax-entry ?\] ")\[" table)    ; blocks
    (modify-syntax-entry ?\. "." table)      ; statement separator
    (modify-syntax-entry ?\; "." table)      ; cascades
    (modify-syntax-entry ?^ "." table)       ; return
    (modify-syntax-entry ?: "w" table)
    table))

(defvar newspeak-comment-face 'font-lock-comment-face)
(defvar newspeak-keyword-face 'font-lock-default-face)
(defvar newspeak-reserved-word-face 'font-lock-keyword-face)
(defvar newspeak-setter-face 'font-lock-warning-face)
(defvar newspeak-type-face 'font-lock-type-face)
(defvar newspeak-variable-name-face 'font-lock-variable-name-face)

(defconst newspeak-mode-font-lock-keywords
  (let* ((reserved-word
          (concat "\\<"
		  ;;(regexp-opt '("false" "nil" "outer" "self" "super" "thisContext" "true"))
		  "\\(false\\|nil\\|outer\\|s\\(elf\\|uper\\)\\|t\\(hisContext\\|rue\\)\\)"
		  "\\>"))
	 (class-name "\\<\\([A-Z][A-Za-z0-9]*\\)\\>")
	 (var-name "\\<\\([a-z][A-Za-z0-9]*\\)\\>")
	 (keyword "\\<\\([a-z][A-Za-z0-9]*:\\)\\>")
	 (setter "\\<\\([a-z][A-Za-z0-9]*::\\)\\>")
	 (comment "\\s<k\\s>")
         keywords)
    (setq keywords
          `((,reserved-word 1 (symbol-value 'newspeak-reserved-word-face))
	    (,class-name 1 (symbol-value 'newspeak-type-face))
	    (,setter 1 (symbol-value 'newspeak-setter-face))
	    (,keyword 1 (symbol-value 'newspeak-keyword-face))
	    (,var-name 1 (symbol-value 'newspeak-variable-name-face))
	    (,comment 1 (symbol-value 'newspeak-comment-face))
	    keywords))))

(define-derived-mode newspeak-mode fundamental-mode "Newspeak"
  "A major mode for editing Newspeak."
  (set (make-local-variable 'indent-tabs-mode) nil)
  (set (make-local-variable 'tab-width) 8)
  (set (make-local-variable 'font-lock-defaults)
       '(newspeak-mode-font-lock-keywords)))