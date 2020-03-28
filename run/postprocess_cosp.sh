#!/bin/bash

INFILE=$1
OUTDIR=$2

i=1
while [ $i -le 50 ] ; do
    vars=`printf "frac_out_%03d,dbze94_%03d" $i $i`
    cdo -f nc4 -z zip_9 selvar,${vars} $INFILE ${OUTDIR}/`basename ${INFILE/.nc/}`_`printf "%03d" $i`.nc &
    i=$(($i + 1))
done

for vars in geosp q aps xivi_na lsp gboxarea xl xi relhum aclc u10 v10 slm xlvi_na ao3 tm1 xi_cosp xl_cosp tm1_cosp ; do
    cdo -f nc4 -z zip_9 selvar,${vars} $INFILE ${OUTDIR}/`basename ${INFILE/.nc/}`_${vars}.nc &  
done

wait

while [ $i -le 100 ] ; do
    vars=`printf "frac_out_%03d,dbze94_%03d" $i $i`
    cdo -f nc4 -z zip_9 selvar,${vars} $INFILE ${OUTDIR}/`basename ${INFILE/.nc/}`_`printf "%03d" $i`.nc &
    i=$(($i + 1))
done

for vars in lsrain lssnow ccrain ccsnow reffl reffi cosp_sunlit cosp_sunlit_av cosp_freq cosp_f3d N_miss_radar radar_lidar_tcc lidar_only_freq_cloud cltisccp pctisccp albisccp tauisccp cisccp_tau3d cisccp_emi3d ; do
    cdo -f nc4 -z zip_9 selvar,${vars} $INFILE ${OUTDIR}/`basename ${INFILE/.nc/}`_${vars}.nc &  
done

# cdo -f nc4 -z zip_9 selvar,geosp,q,aps,xivi_na,lsp,gboxarea,xl,xi,relhum,aclc,u10,v10,slm,xlvi_na,ao3,tm1,xi_cosp,xl_cosp,tm1_cosp,lsrain,lssnow,ccrain,ccsnow,reffl,reffi,cosp_sunlit,cosp_sunlit_av,cosp_freq,cosp_f3d,N_miss_radar,radar_lidar_tcc,lidar_only_freq_cloud,cltisccp,pctisccp,albisccp,tauisccp,cisccp_tau3d,cisccp_emi3d $INFILE ${OUTDIR}/`basename ${INFILE/.nc/}`.nc &

wait
