#!/bin/bash

module load r/3.3.3

RPATH=/pf/b/b380126/echam-ham/echam6.1-ham2.2-moz0.9/run

Rscript --vanilla ${RPATH}/summarize.r $*
