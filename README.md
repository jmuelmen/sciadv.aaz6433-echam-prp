# acp-2018-1304-echam-prp
PRP code to reproduce acp-2018-1304 (https://doi.org/10.5194/acp-2018-1304) results

## Instructions

To reproduce the PRP results, you will need to run the ECHAM-HAM model to
generate model output (some of it 3-hourly) and then run the ECHAM PRP driver on
the model output.

### ECHAM-HAM

First, follow the instructions at
https://redmine.hammoz.ethz.ch/projects/hammoz/wiki/Echam610-ham22-moz09 to
obtain and build the model code.  This requires acknowledgment of the HAMMOZ
license. 

Once you have built the model, you can use the run scripts in the run/ directory
to generate the model output used in the manuscript.

### PRP

To build the PRP driver, start with a fresh copy of ECHAM-HAM according to the
above instructions.

You probably do not want to use the tree you used to produce the model output,
as the next step will change your working copy beyond recognition (and will
prevent you from running in anything other than PRP mode).

Apply the patch 0001-Turn-ECHAM-HAM-source-tree-into-PRP-driver.patch; as the
name implies, you will now have the source code for the PRP driver.  (Due to
restrictions in the MPI license, the PRP driver can only be distributed as a
patch.)

To build the driver, 

```sh
cd build
make -j 8 radiation_prog.x
```

Note that you may have to adapt the Makefile for your compiler, NetCDF
installation, etc.

The scripts in bin/ (in particular run_3h.sh for the recommended, 3-hourly, PRP)
apply the PRP driver to the model output; you may need to modify these DKRZ
Mistral-specific scripts for your batch system.

### Postprocessing/analysis

Use the jmuelmen/acp-2018-1304 github repository to recreate the
results/tables/figures in the manuscript (https://doi.org/10.5194/acp-2018-1304)
-- or indeed to recreate the manuscript, which is just a LaTeX/R knitr script.
The manuscript contains a source code DOI for the jmuelmen/acp-2018-1304 github
repository. 

Note: if you are only interested in reproducing the analysis, it is not
necessary to regenerate the PRP output.  Instead, use the data DOI in the
manuscript to download the PRP results.
