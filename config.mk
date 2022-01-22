VERSION = 0.0.1

APPNAME = xwallpaper

# Paths
PREFIX = /usr/local
MANPREFIX = ${PREFIX}/share/man
#INSTALLPATH = ${PREFIX}/${APPNAME}
#BINPATH = ${PREFIX}/bin
BINPATH = ~/bin/

# Includes and libraries
LIBS = xcb xcb-aux xcb-randr xcb-image pixman-1 libpng libjpeg xpm

INCLUDES  != pkg-config --cflags ${LIBS}
LIBRARIES != pkg-config --libs ${LIBS}

DIRECTIVES = -DVERSION=\"${VERSION}\"

#CFLAGS = -ansi -pedantic -Wall -Werror ${INCLUDES}
CFLAGS = ${DIRECTIVES} ${INCLUDES}
LFLAGS =  ${LIBRARIES}

# Compiler and linker
CC = cc
LINKER = ${CC}
