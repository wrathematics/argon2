AC_PREREQ([2.69])
AC_INIT
AC_CONFIG_SRCDIR([DESCRIPTION])
m4_include([tools/ax_gcc_x86_cpu_supports.m4])

# Get C compiler from R
: ${R_HOME=`R RHOME`}
if test -z "${R_HOME}"; then
  echo "could not determine R_HOME"
  exit 1
fi
CC=`"${R_HOME}/bin/R" CMD config CC`


AC_LANG_PUSH([C])
AC_CACHE_CHECK([for ${CC} __builtin_cpu_init function],
  [ax_cv_gcc_check_x86_cpu_init],
  [AC_RUN_IFELSE(
    [AC_LANG_PROGRAM([#include <stdlib.h>],
      [__builtin_cpu_init ();])
    ],
    [ax_cv_gcc_check_x86_cpu_init=yes],
    [ax_cv_gcc_check_x86_cpu_init=no])])
AS_IF([test "X$ax_cv_gcc_check_x86_cpu_init" = "Xno"], [CC_IS_GCC="no"], [CC_IS_GCC="yes"])

if test "X${CC_IS_GCC}" = "Xyes"; then
  AX_GCC_X86_CPU_SUPPORTS(avx512f, [HAS_AVX512F="yes"],[HAS_AVX512F="no"])
  AX_GCC_X86_CPU_SUPPORTS(avx2, [HAS_AVX2="yes"],[HAS_AVX2="no"])
  AX_GCC_X86_CPU_SUPPORTS(sse2, [HAS_SSE2="yes"],[HAS_SSE2="no"])
  
  if test "X${HAS_AVX512F}" = "Xno" -a "X${HAS_AVX2}" = "Xno" -a "X${HAS_SSE2}" = "Xno"; then
    FILL_IMPL="ref.o"
  else
    FILL_IMPL="opt.o"
  fi
else
  HAS_AVX512F="unknown - couldn't find gcc"
  HAS_AVX2="${HAS_AVX512F}"
  HAS_SSE2="${HAS_AVX512F}"
  FILL_IMPL="ref.o"
fi



echo " "
echo "****************** Results of argon2 package configure *******************"
echo "* Arch Report"
echo "*   >> AVX512f = ${HAS_AVX512F}"
echo "*   >> AVX2 = ${HAS_AVX2}"
echo "*   >> SSE2 = ${HAS_SSE2}"
echo "**************************************************************************"
echo " "

AC_SUBST(FILL_IMPL)
AC_CONFIG_FILES([src/Makevars])
AC_OUTPUT
