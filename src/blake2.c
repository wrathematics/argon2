/*  Copyright (c) 2016-2017 Drew Schmidt
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


#include "common.h"
#include "argon2/blake2/blake2.h"

#define HASHLEN 64

SEXP R_blake2b(SEXP in_, SEXP key_)
{
  SEXP ret;
  void *in;
  size_t inlen;
  void *key;
  size_t keylen;
  
  switch (TYPEOF(in_))
  {
    case STRSXP:
      in = (void*) CHARPT(in_, 0);
      inlen = strlen(in);
      break;
      
    case RAWSXP:
      in = RAW(in_);
      inlen = LENGTH(in_);
      break;
    
    default:
      error(ERR_IMPOSSIBLE);
  }
  
  switch (TYPEOF(key_))
  {
    case NILSXP:
      key = NULL;
      keylen = 0;
      break;
    
    case STRSXP:
      key = (void*) CHARPT(key_, 0);
      keylen = strlen(key);
      break;
      
    case RAWSXP:
      key = RAW(key_);
      keylen = LENGTH(key_);
      break;
    
    default:
      error(ERR_IMPOSSIBLE);
  }
  
  if (keylen > HASHLEN)
    error("'key' must have no more than %d elements\n", HASHLEN);
  
  PROTECT(ret = allocVector(RAWSXP, HASHLEN));
  uchar_t *const hash = RAW(ret);
  
  blake2b(hash, HASHLEN, in, inlen, key, keylen);
  
  UNPROTECT(1);
  return ret;
}
