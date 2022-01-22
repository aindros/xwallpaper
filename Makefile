include config.mk

# Excludes seccomp.c because it isn't compatible with FreeBSD
SOURCES = debug.c load_jpeg.c load_png.c load_xpm.c main.c options.c outputs.c util.c
OBJECTS = ${SOURCES:.c=.o}

.SUFFIXES: .c .o

${APPNAME}: config.h ${OBJECTS}
	${LINKER} ${LFLAGS} ${OBJECTS} -o ${.TARGET}

config.h: config.def.h
	${MAKE} clean
	cp config.def.h config.h

.c.o:
	${CC} ${CFLAGS} -c ${.IMPSRC}

all: ${APPNAME}

clean:
	rm -f *.o config.h
	rm -f ${APPNAME}
