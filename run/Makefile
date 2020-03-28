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
all:	rain_0.rds rain_0.0001.rds rain_0.0001_0.1.rds rain_0.0001_10.rds rain_0.0001_100.rds rain_0.0001_1000.rds rain_0.0001_1_-1.rds rain_0.0001_15.rds rain_0.0001_150.rds rain_0.0001_1e+06.rds rain_0.0001_1_pi.rds rain_0.0001_50.rds rain_0.001_0.1.rds rain_0.001_15.rds rain_0.001_150.rds rain_0.01_0.1.rds rain_0.01_10.rds rain_0.01_100.rds rain_0.01_1000.rds rain_0.01_1_-1.rds rain_0.01_15.rds rain_0.01_150.rds rain_0.01_1e+06.rds rain_0.01_50.rds rain_1.rds rain_1_1_15.rds rain_1_1_17.rds rain_1_1_20.rds rain_15.rds rain_1e-02.rds rain_1e-07.rds rain_1e-5.rds rain_1e-6.rds rain_4.rds rain_4_1_-1.rds rain_4_1_12.rds rain_4_1_15.rds rain_4_1_20.rds rain_4_1_50.rds rain_4_1_pi.rds
