# $Id: makefile.unx,v 1.3 1991/11/15 19:31:00 piet Rel $

CFLAGS = -O -w
# If you have an old version of flex that defines yyleng
# as a macro rather than a variable, uncomment the following line:
# CFLAGS = -O -DNO_YYLENG_VAR

EXECS = mf2t t2mf

all:	$(EXECS)

t2mf:	midifile.o t2mf.o t2mf.h t2mflex.o crack.o
	$(CC) t2mf.o midifile.o crack.o t2mflex.o -o t2mf

t2mflex.c: t2mf.fl
	flex -is -Ce t2mf.fl
	mv lex.yy.c t2mflex.c

t2mflex.o: t2mflex.c t2mf.h

mf2t:	midifile.o mf2t.o crack.o
	$(CC) mf2t.o midifile.o crack.o -o mf2t

clean:
	rm -f t2mf mf2t *.o
