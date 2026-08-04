# Build the summer school handouts.
#
# hydro_equation_derivation must be built before the lecture notes: the notes
# use xr to read equation numbers out of its .aux file.

TEXDIR  := tex
HANDOUT := hydro_equation_derivation
NOTES   := fisher_icesun_lecture_notes_typeset
LATEX   := pdflatex -interaction=nonstopmode -file-line-error

.PHONY: all clean

all:
	cd $(TEXDIR) && for i in 1 2 3; do $(LATEX) $(HANDOUT).tex >/dev/null; done
	cd $(TEXDIR) && for i in 1 2 3; do $(LATEX) $(NOTES).tex   >/dev/null; done
	cp $(TEXDIR)/$(HANDOUT).pdf $(TEXDIR)/$(NOTES).pdf .
	@echo "Built $(HANDOUT).pdf and $(NOTES).pdf"

clean:
	rm -f $(TEXDIR)/*.aux $(TEXDIR)/*.log $(TEXDIR)/*.out \
	      $(TEXDIR)/*.toc $(TEXDIR)/*.synctex.gz $(TEXDIR)/*.pdf
