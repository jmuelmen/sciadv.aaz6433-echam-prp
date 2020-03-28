# sciadv.aaz6433-echam-prp
PRP code and COSP and other warm rain diagnostics to reproduce sciadv.aaz6433
(https://doi.org/10.1126/sciadv.aaz6433) results 

## Instructions

To reproduce the PRP results, you will need to run the ECHAM-HAM model to
generate (3-hourly) model output and then run the ECHAM PRP driver on
the model output.

To reproduce the COSP and other warm rain diagnostics, you will need to run the
ECHAM-HAM model and then run the postprocessing scripts 

### ECHAM-HAM

First, follow the instructions at
https://redmine.hammoz.ethz.ch/projects/hammoz/wiki/Echam610-ham22-moz09 to
obtain the model code.  This requires acknowledgment of the HAMMOZ license.

Then, apply the patch 0001-Add-COSP-and-other-warm-rain-diagnostics-to-ECHAM-HA.patch 
to the fresh source tree.

Then follow the default instructions to build the model.

Once you have built the model, you can use the run scripts in the run/ directory
to generate the model output used in the manuscript.  (Yes, there are many.
Yes, all of them are used in the analysis.)

To generate the summary data files used in the analysis, run (32 parallel jobs,
modify as necessary)

```sh
make -j 32 all
```

in the run/ directory.  Note that you will need to install the echamtools R
package (https://doi.org/10.5281/zenodo.3731767) as a prerequisite.  Also note
that the Makefile and the scripts it calls are specific to the mistral machine
and project accounts at DKRZ and will require modification to run elsewhere.

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

Use the jmuelmen/sciadv.aaz6433 github repository to recreate the
results/tables/figures in the manuscript (https://doi.org/10.1126/sciadv.aaz6433). 
The manuscript contains a source code DOI for the jmuelmen/sciadv.aaz6433 github
repository. 

Note: if you are only interested in reproducing the analysis, it is not
necessary to regenerate the model or PRP output.  Instead, use the data DOI in
the manuscript to download the summary results files.
