AC_INIT([389-posix-ws-plugin],[0.0.1])

AM_INIT_AUTOMAKE

AC_CANONICAL_HOST
AC_PROG_CC

# Checks for header files.
AC_CHECK_HEADERS([string.h strings.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_HEADER_STDBOOL
AC_TYPE_SIZE_T

# Checks for library functions.
AC_CHECK_FUNCS([strncasecmp strtol])

# Determine PIC flag, adjust default CFLAGS
pic_flag=
shared_flag=
AC_MSG_CHECKING(Determining PIC compiler/shared linker flag)
if test "$GCC" = yes; then
  AC_MSG_RESULT(-fPIC)
  pic_flag=-fPIC
  shared_flag=-shared
else
  case "$host" in
    *-*-hpux*)
      AC_MSG_RESULT("+Z")
      pic_flag="+Z"
      ;;
    *-*-solaris*)
      AC_MSG_RESULT(-Kpic)
      pic_flag=-Kpic
      shared_flag=-G
      ;;
    *-*-linux*)
      AC_MSG_RESULT(-fPIC)
      pic_flag=-fPIC
      # Any Linux compiler had better be gcc compatible.
      ;;
    *)
      echo "Host : $host"
      AC_MSG_RESULT("<none>")
      ;;
  esac
fi
AC_SUBST(pic_flag)
AC_SUBST(shared_flag)

AC_MSG_CHECKING(for --enable-debug)
AC_ARG_ENABLE(debug, AS_HELP_STRING([--enable-debug], [Enable debug features (default: no)]),
[
  AC_MSG_RESULT(yes)
  debug_defs="-DDEBUG -DMCC_DEBUG"
],
[
  AC_MSG_RESULT(no)
  debug_defs=""
])
AC_SUBST([debug_defs])

# check for --with-nspr-inc
AC_MSG_CHECKING(for --with-nspr-inc)
AC_ARG_WITH(nspr-inc, AS_HELP_STRING([--with-nspr-inc=PATH],[Mozilla Portable Runtime include directory]),
[
  if test -e "$withval"/prtypes.h
  then
    AC_MSG_RESULT([using $withval])
    nspr_inc="-I$withval"
  else
    echo
    AC_MSG_ERROR([$withval not found])
  fi
],
[
  AC_MSG_RESULT(no)
  nspr_inc=""
])
AC_SUBST([nspr_inc])

# check for --with-ldapsdk-inc
AC_MSG_CHECKING(for --with-ldapsdk-inc)
AC_ARG_WITH(ldapsdk-inc, AS_HELP_STRING([--with-ldapsdk-inc=PATH],[Mozilla LDAPSDK include directory]),
[
  if test -e "$withval"/ldap.h
  then
    AC_MSG_RESULT([using $withval])
    ldapsdk_inc="-I$withval"
  else
    echo
    AC_MSG_ERROR([$withval not found])
  fi
],
[
  AC_MSG_RESULT(no)
  ldapsdk_inc=""
])
AC_SUBST([ldapsdk_inc])

# check for --with-ds-inc
AC_MSG_CHECKING(for --with-ds-inc)
AC_ARG_WITH(ds-inc, AS_HELP_STRING([--with-ds-inc=PATH],[Port389 DS include directory]),
[
  if test -e "$withval"/slapi-plugin.h
  then
    AC_MSG_RESULT([using $withval])
    ds_inc="-I$withval"
  else
    echo
    AC_MSG_ERROR([$withval not found])
  fi
],
[
  AC_MSG_RESULT(no)
  ds_inc=""
])
AC_SUBST([ds_inc])

# check for --with-ds-ws-inc
AC_MSG_CHECKING(for --with-ds-ws-inc)
AC_ARG_WITH(ds-inc, AS_HELP_STRING([--with-ds-ws-inc=PATH],[Port389 DS WinSync include directory]),
[
  if test -e "$withval"/winsync-plugin.h
  then
    AC_MSG_RESULT([using $withval])
    ds_ws_inc="-I$withval"
  else
    echo
    AC_MSG_ERROR([$withval not found])
  fi
],
[
  AC_MSG_RESULT(no)
  ds_ws_inc=""
])
AC_SUBST([ds_ws_inc])

AC_OUTPUT([
Makefile
])
