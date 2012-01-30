# $Id: Makefile 30 2011-05-13 14:35:55Z grzemba $

PICFLAG = @pic_flag@
SHARED = @shared_flag@
DEBUG_DEFINES = @debug_defs@
DS_INCLUDES=@ds_inc@
DS_WS_INCLUDES=@ds_ws_inc@
LDAP_INCLUDES=@ldapsdk_inc@
NSPR_INCLUDES=@nspr_inc@
CFLAGS = $(PICFLAG) -c -D WINSYNC_TEST_POSIX $(DEBUG_DEFINES) \
    $(DS_INCLUDES) $(NSPR_INCLUDES) $(DS_WS_INCLUDES)

all: posix-winsync.o posix-group-func.o posix-winsync-config.o
	$(LD) $(SHARED) posix-winsync.o posix-group-func.o posix-winsync-config.o -o libposix-winsync.so

posix-winsync.o: posix-winsync.c posix-group-func.h posix-wsp-ident.h
	$(CC) $(CFLAGS) posix-winsync.c

posix-group-func.o: posix-group-func.c posix-group-func.h posix-wsp-ident.h
	$(CC) $(CFLAGS) posix-group-func.c

posix-winsync-config.o: posix-winsync-config.c posix-wsp-ident.h
	$(CC) $(CFLAGS) posix-winsync-config.c

clean:
	rm *.o lib*so*
