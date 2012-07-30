# $Id: Makefile 30 2011-05-13 14:35:55Z grzemba $

PICFLAG = @pic_flag@
SHARED = @shared_flag@
DEBUG_DEFINES = 
DS_INCLUDES=@ds_inc@
DS_WS_INCLUDES=@ds_winsync_inc@
NSPR_INCLUDES=@nspr_inc@

pkglibdir=$(libdir)/dirsrv/plugins
pkgdatadir=$(datadir)/dirsrv/data/plugins

LIBNAME = libposix-winsync.so
CONFFILE = posix-winsync-conf.ldif
AM_CFLAGS = $(PICFLAG) -O3 -m64 -c -D WINSYNC_TEST_POSIX $(DEBUG_DEFINES) \
    $(DS_INCLUDES) $(DS_WS_INCLUDES) $(NSPR_INCLUDES)

pkglib_LTLIBRARIES = libposix-winsync.la
libposix_winsync_la_SOURCES = posix-winsync.c posix-group-func.c posix-group-task.c posix-winsync-config.c
#libposix_winsync_la_CPPFLAGS = $(AM_CFLAGS)
libposix_winsync_la_LDFLAGS = -avoid-version

pkgdata_DATA = $(srcdir)/$(CONFFILE)

distclean: clean
	rm -f config.* *~ Makefile Makefile.in autoscan.log
	rm -rf autom4te.cache
