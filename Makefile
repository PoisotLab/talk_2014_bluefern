PRES=macroevo
SLIDES=slides_$(PRES).pdf
LENGINE=pdflatex
LOPT= -shell-escape

.PHONY: clean

all: data $(SLIDES)

data: data/post.dat
	grep "disp" $< > data/post_disp.dat
	grep "poll" $< > data/post_poll.dat
	grep "para" $< > data/post_para.dat
	grep "phag" $< > data/post_phag.dat
	grep "herb" $< > data/post_herb.dat

clean:
	rm -f $(PRES).{log,aux,nav,out,snm,toc,pdf}

$(SLIDES): $(PRES).tex
	$(LENGINE) $< $(LOPT)
	mv $(PRES).pdf $@
