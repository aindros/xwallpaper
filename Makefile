include config.mk

SOURCES = debug.c load_jpeg.c load_png.c load_xpm.c main.c options.c outputs.c util.c
OBJECTS = ${SOURCES:.c=.o}

.SUFFIXES: .c .o

all: config.h ${APPNAME}

${APPNAME}: ${OBJECTS}
	${LINKER} ${LFLAGS} ${.ALLSRC} -o ${.TARGET}

config.h: clean config.def.h
	cp config.def.h config.h

clean:
	rm -f *.o config.h
	rm -f ${APPNAME}

.c.o:
	${CC} ${CFLAGS} -c ${.IMPSRC}