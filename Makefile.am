# $Id: Makefile 30 2011-05-13 14:35:55Z grzemba $

PICFLAG = @pic_flag@
SHARED = @shared_flag@
DEBUG_DEFINES = 
DS_INCLUDES=@ds_inc@
NSPR_INCLUDES=@nspr_inc@

pkglibdir=$(libdir)/dirsrv/plugins
pkgdatadir=$(datadir)/dirsrv/data/plugins

LIBNAME = libposix-winsync.so
CONFFILE = posix-winsync-conf.ldif
CFLAGS = $(PICFLAG) -c -D WINSYNC_TEST_POSIX $(DEBUG_DEFINES) \
    $(DS_INCLUDES) $(NSPR_INCLUDES)

all: posix-winsync.o posix-group-func.o posix-winsync-config.o
	$(LD) $(SHARED) posix-winsync.o posix-group-func.o posix-winsync-config.o -o $(LIBNAME)

posix-winsync.o: posix-winsync.c posix-group-func.h posix-wsp-ident.h
	$(CC) $(CFLAGS) posix-winsync.c

posix-group-func.o: posix-group-func.c posix-group-func.h posix-wsp-ident.h
	$(CC) $(CFLAGS) posix-group-func.c

posix-winsync-config.o: posix-winsync-config.c posix-wsp-ident.h
	$(CC) $(CFLAGS) posix-winsync-config.c

install:
	ginstall -d 755 $(DESTDIR)$(pkglibdir)
	ginstall -m 755 $(LIBNAME) $(DESTDIR)$(pkglibdir)
	ginstall -d 755 $(DESTDIR)$(pkgdatadir)
	ginstall -m 644 $(CONFFILE) $(DESTDIR)$(pkgdatadir)

clean:
	rm *.o lib*so*

distclean: clean
	rm -f config.* *~ Makefile Makefile.in autoscan.log
	rm -rf autom4te.cache
