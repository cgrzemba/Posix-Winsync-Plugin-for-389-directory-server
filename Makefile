# $Id: Makefile 30 2011-05-13 14:35:55Z grzemba $

FEDORA_BASE=/home/devel/src/fedora-ds
CFLAGS = -g -shared -m64 -fpic -c -D WINSYNC_TEST_POSIX \
    -I $(FEDORA_BASE)/ds/ldap/servers/slapd \
    -I $(FEDORA_BASE)/ds/ldap/servers/plugins/replication \
    -I /usr/include/mps

all: posix-winsync.o posix-group-func.o posix-winsync-config.o
	ld -G posix-winsync.o posix-group-func.o posix-winsync-config.o -o libposix-winsync.so

posix-winsync.o: posix-winsync.c posix-group-func.h posix-wsp-ident.h
	cc $(CFLAGS) posix-winsync.c

posix-group-func.o: posix-group-func.c posix-group-func.h posix-wsp-ident.h
	cc $(CFLAGS) posix-group-func.c

posix-winsync-config.o: posix-winsync-config.c posix-wsp-ident.h
	cc $(CFLAGS) posix-winsync-config.c
