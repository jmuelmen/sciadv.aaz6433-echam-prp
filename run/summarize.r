#! /sw/rhel6-x64/r/r-3.2.0-gcc48/bin/Rscript --vanilla
library(getopt)
library(echamtools)
library(parallel)

print(version)

spec = matrix(c(
##    'verbose', 'v', 2, "integer",
    'help'              , 'h', 0, "logical",    "",
    'datadir'           , 'd', 1, "character",  "",
    'experiment'        , 'e', 1, "character",  "",
    'ncores'            , 'n', 1, "integer",    "",
    'prefix'            , 'p', 1, "character",  "outfile prefix, default none; terminate with dash",
    'subsample'         , 's', 1, "integer",    "number of steps to subsample, default NULL",
    'years'             , 'y', 1, "character",  "years (in range notation), default 1979:1983"
), byrow=TRUE, ncol=5);

opt = getopt(spec, opt = commandArgs(TRUE));

## if help was asked for print a friendly message
## and exit with a non-zero error code
if ( !is.null(opt$help) ) {
    cat(getopt(spec, usage=TRUE));
    q(status=1);
}

## get rid of spurious "ARGS" list element
if (names(opt)[1] == "ARGS")
    opt <- opt[-1];

## parse years to get an integer vector
if (!is.null(opt$years)) {
    opt$years <- eval(parse(text = opt$years));
}

## TEST
## process.precip.profile.echam.dummy <-
##     function(datadir = "/work/bb0839/b380126/mpiesm-1.2.00p1/src/echam/experiments",
##              experiment = "amip-rain-15", years = 1979:1983,
##              ncores = 36) {
##         print(years)
##         print(datadir)
##         print(experiment)
##         return(NULL)
##     }
## do.call(process.precip.profile.echam.dummy, opt);

mcparallel <- I

## mcparallel({
##     do.call(process.precip.cosp.profile.echam, opt);
##     do.call(postprocess.precip.cosp.profile.echam, opt);
## })

mcparallel({
    do.call(process.rad.echam, opt); 
    do.call(postprocess.rad.echam, opt);
})
## mcparallel(do.call(process.precip.profile.echam, opt));
## mcparallel(do.call(process.precip.profile.echam, c(opt, flux = FALSE)));
## mcparallel(do.call(process.cfodd.echam, opt));
## do.call(process.forcing.echam, opt);
## mcparallel(do.call(process.pr.echam, opt));

## mccollect();

## do.call(process.precip.profile.echam, c(opt, flux = FALSE));

q();

