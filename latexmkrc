# -*- perl -*-
# The Inria RADAR Project
# ----------------------------------------------
# latexmk configuration for Inria annual report
# ---------------------------------------------
# See https://ctan.org/pkg/latexmk

$pdf_mode = 1; # Use pdflatex
$biber='biber --output-safechars'; # better unicode handling
@default_files = ('DIVERSE-RA-2023.tex'); # Set the main filename;
