/* Automatically generated. Do not edit by hand. */
  
#include <R.h>
#include <Rinternals.h>
#include <R_ext/Rdynload.h>
#include <stdlib.h>

extern SEXP R_argon2_hash(SEXP pass_, SEXP type_);
extern SEXP R_argon2_verify(SEXP hash_, SEXP pass_);
extern SEXP R_blake2b(SEXP in_, SEXP key_);
extern SEXP R_gen_nonce(SEXP len_);
extern SEXP R_raw_to_char(SEXP rawvec_, SEXP upper_, SEXP spaces_);

static const R_CallMethodDef CallEntries[] = {
  {"R_argon2_hash", (DL_FUNC) &R_argon2_hash, 2},
  {"R_argon2_verify", (DL_FUNC) &R_argon2_verify, 2},
  {"R_blake2b", (DL_FUNC) &R_blake2b, 2},
  {"R_gen_nonce", (DL_FUNC) &R_gen_nonce, 1},
  {"R_raw_to_char", (DL_FUNC) &R_raw_to_char, 3},
  {NULL, NULL, 0}
};

void R_init_argon2(DllInfo *dll)
{
  R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
  R_useDynamicSymbols(dll, FALSE);
}
