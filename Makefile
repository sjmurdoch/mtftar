CFLAGS += -Wall -D_GNU_SOURCE -fno-strict-aliasing

#test: mtftar
#	./mtftar -X "`./mtftar -s1 -L -f READY.bkf`" -p -f READY.bkf d:/inetpub/ | tar tvf -

all: mtftar
	strip $<
mtftar: mtftar.o mtfscan.o mtfheader.o mtfstream.o tarout.o util.o
mtftar.o: mtftar.c mtf.h tar.h
mtfstream.o: mtfstream.c mtf.h
mtfscan.o: mtfscan.c mtf.h
mtfheader.o: mtfheader.c mtf.h


tarout.o: tarout.c tar.h

util.o: util.c util.h

clean:;rm -f *.o mtftar
