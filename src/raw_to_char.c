/*  Copyright (c) 2016 Drew Schmidt
    All rights reserved.
    
    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:
    
    1. Redistributions of source code must retain the above copyright notice,
    this list of conditions and the following disclaimer.
    
    2. Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.
    
    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
    TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
    PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
    CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
    EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
    PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
    PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
    LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
    NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
    SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/


#include <string.h>
#include <stdlib.h>
#include <stdint.h>

#include "common.h"
#include "argon2/blake2/blake2.h"


SEXP R_raw_to_char(SEXP rawvec_, SEXP upper_, SEXP spaces_)
{
  SEXP ret;
  uint8_t *rv = (uint8_t*) RAW(rawvec_);
  const int rvlen = LENGTH(rawvec_);
  const int spaces = LOGICAL(spaces_)[0];
  const int upper = LOGICAL(upper_)[0];
  const char *fmt = upper ? "%2.2X" : "%2.2x";
  
  const int factor = spaces ? 3 : 2;
  const int encolen = factor*rvlen;
  char *enco = malloc(factor*rvlen);
  
  for (int i=0; i<rvlen; i++)
  {
    sprintf(enco + factor*i, fmt, rv[i]);
    if (spaces)
      sprintf(enco + factor*i + 2, " ");
  }
  
  PROTECT(ret = allocVector(STRSXP, 1));
  const int retlen = spaces ? encolen-1 : encolen;
  SET_STRING_ELT(ret, 0, mkCharLen(enco, retlen));
  
  for (int i=0; i<encolen; i++)
    enco[i] = '\0';
  
  free(enco);
  
  UNPROTECT(1);
  return ret;
}
