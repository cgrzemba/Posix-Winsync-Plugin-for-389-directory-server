AC_INIT([posix-winsync-plugin],[0.0.1])

AM_INIT_AUTOMAKE

AC_CONFIG_SRCDIR([.])

AC_CANONICAL_HOST
AC_PROG_CC

AC_PROG_LIBTOOL

# Checks for header files.
AC_CHECK_HEADERS([string.h strings.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_HEADER_STDBOOL
AC_TYPE_SIZE_T

# Checks for library functions.
AC_CHECK_FUNCS([strncasecmp strtol strncat])

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

# check for --with-ds-winsync-inc
AC_MSG_CHECKING(for --with-ds-winsync-inc)
AC_ARG_WITH(ds-winsync-inc, AS_HELP_STRING([--with-ds-winsync-inc=PATH],[Port389 DS winsync include directory]),
[
  if test -e "$withval"/winsync-plugin.h
  then
    AC_MSG_RESULT([using $withval])
    ds_winsync_inc="-I$withval"
  else
    echo
    AC_MSG_ERROR([$withval not found])
  fi
],
[
  AC_MSG_RESULT(no)
  ds_winsync_inc=""
])
AC_SUBST([ds_winsync_inc])

AC_OUTPUT([
Makefile
])
