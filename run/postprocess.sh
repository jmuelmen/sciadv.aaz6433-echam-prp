#!/bin/bash

SCRATCHDIR=/scratch/`echo $USER | cut -b 1`/$USER
WORKDIR=/work/bb0839/$USER

for exp in $* ; do
    mkdir -p $WORKDIR/${exp}

    ## these files are not currently prerequisites for anything, so
    ## they can execute asynchronously
    for i in $SCRATCHDIR/${exp}/*_cosp.nc ; do
	TARGET=$WORKDIR/${exp}/$(basename ${i/cosp.nc/cosp_001.nc})
	if ! [ -e ${TARGET} ] ; then
	    echo env SBATCH_JOB_PARTITION="compute,compute2" SBATCH_CPU_FREQ_REQ=High sbatch \
		-A bb1001 -p compute,compute2 --time=00:30:00 \
		postprocess_cosp.sh $i $WORKDIR/${exp}
	fi
    done
    
    (
	cd $SCRATCHDIR/${exp}
	for j in echam rain2d rain3d activ forcing; do
	    for i in *_${j}.nc ; do
		if ! [ -e $WORKDIR/${exp}/$i ] ; then
		    cdo -f nc4 -z zip_1 copy $i $WORKDIR/${exp}/$i &
		fi
	    done
	    wait
	done
    ) &

    wait
done

# ## special treatment for ccraut=15 (the default, which doesn't have a special name)
# ccraut=15
# (
#     cd $SCRATCHDIR/amip-rain
#     for j in echamm rain2d rain3d ; do
# 	for i in amip-rain*_${j}.nc ; do
# 	    cdo -f nc4 -z zip_9 copy $i $WORKDIR/amip-rain-${ccraut}/${i/amip-rain/amip-rain-${ccraut}} &
# 	done
# 	wait
#     done
# )
