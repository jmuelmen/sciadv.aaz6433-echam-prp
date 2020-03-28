POSTPROCESS = ./postprocess.sh
SUMMARIZE = ./summarize.sh
SUMMARIZEFLAGS = --years=2000:2004 -d /work/bb0839/b380126
SRUNENV = SLURM_JOB_PARTITION=prepost SLURM_CPU_FREQ_REQ=High
SRUNFLAGS = -A bb1002 -p prepost  --time=02:00:00 --exclusive --mem=240G

.PRECIOUS:	/work/bb0839/b380126/%
/work/bb0839/b380126/%:
	@ echo using shell script to make $@
	env $(SRUNENV) srun $(SRUNFLAGS) \
		$(POSTPROCESS) $(shell basename $@) 

%.rds:	/work/bb0839/b380126/%
	@ echo using R to make $@
	env $(SRUNENV) srun $(SRUNFLAGS) \
		$(SUMMARIZE) -e ${@:.rds=} $(SUMMARIZEFLAGS)

.PHONY:	all
all:	rain_0.04_1_-1_nudged_3hourly.rds rain_0.1_1_-1_no-cosp_nudged_3hourly.rds rain_0.1_1_-1_nudged_daily.rds rain_0.4_1_-1_no-cosp_nudged_3hourly.rds rain_0.4_1_-1_nudged_daily.rds rain_1_1_-1_no-cosp_nudged_3hourly.rds rain_1_1_-1_nudged_daily.rds rain_2_1_-1_nudged_3hourly.rds rain_4_1_10_no-cosp_nudged_3hourly.rds rain_4_1_10_nudged_daily.rds rain_4_1_12_no-cosp_nudged_3hourly.rds rain_4_1_12_nudged_daily.rds rain_4_1_15_nudged_3hourly.rds rain_4_1_17_nudged_3hourly.rds rain_4_1_-1_cautalpha_1.25_nudged_3hourly.rds rain_4_1_-1_cautalpha_1.5_nudged_3hourly.rds rain_4_1_-1_cautalpha_1.75_nudged_3hourly.rds rain_4_1_-1_cautalpha_2.25_nudged_3hourly.rds rain_4_1_-1_cautalpha_2.8_nudged_3hourly.rds rain_4_1_-1_cautalpha_2_nudged_3hourly.rds rain_4_1_-1_cautalpha_3.2_nudged_3hourly.rds rain_4_1_-1_cautalpha_3.6_nudged_3hourly.rds rain_4_1_-1_cautalpha_4.5_nudged_3hourly.rds rain_4_1_-1_cautalpha_4_nudged_3hourly.rds rain_4_1_-1_cautalpha_5_nudged_3hourly.rds rain_4_1_-1_cautbeta_-1.2_nudged_3hourly.rds rain_4_1_-1_cautbeta_-1.4_nudged_3hourly.rds rain_4_1_-1_cautbeta_-1.6_nudged_3hourly.rds rain_4_1_-1_cautbeta_-1_nudged_3hourly.rds rain_4_1_-1_cautbeta_-2.4_nudged_3hourly.rds rain_4_1_-1_cautbeta_-2.8_nudged_3hourly.rds rain_4_1_-1_cautbeta_-2_nudged_3hourly.rds rain_4_1_-1_cautbeta_-3.2_nudged_3hourly.rds rain_4_1_-1_cautbeta_-3.6_nudged_3hourly.rds rain_4_1_-1_nudged_3hourly.rds rain_4_1_-1.rds rain_4_1_20_nudged_3hourly.rds rain_4_1_2_nudged_3hourly.rds rain_4.rds
