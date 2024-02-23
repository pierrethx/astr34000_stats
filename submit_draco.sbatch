#!/bin/bash
#SBATCH --job-name=DM_simu
#SBATCH --output=logs/%A_%a_DM_simu.out
#SBATCH --error=logs/%A_%a_DM_simu.err
#SBATCH --time=08:00:00
###SBATCH --partition=broadwl
#SBATCH --partition=kicp
##########SBATCH --nodes=1
###########SBATCH --ntasks-per-node=6
###########  #SBATCH --ntasks=8
############SBATCH --mem-per-cpu=8000
#####SBATCH --account=pi-alexji
#SBATCH --account=kicp
#SBATCH --array=1-98



sleep 10

start_time=$SECONDS

#module unload gcc
#module unload python
#module load python
#conda deactivate
#conda activate smhr-py3
#module load gcc/10.2.0
#conda activate smhr-py3

cd /home/pthibodeaux/dmatter/dsphsim/astr34000_stats/

inst=IMACS
tottime=43200
nframe=100
i=$SLURM_ARRAY_TASK_ID

source ~/.bashrc
start


for k in {1..10}

do

    for n in 1.0  #0.0 0.5 1.0 1.5
    do
        module unload python
        echo vsys $n iteration $i

        nstar=$(($nframe*$k))
        obstime=$(($tottime/$k))

        module load python/anaconda-2020.02
        python ../dsphsim/simulator.py --stellar_mass 320000 --rhalf .196 --vmax 18.197 --rvmax 0.759 --distance 76 --kinematics Physical --vsys $n temp_$SLURM_ARRAY_TASK_ID.txt --instrument $inst --obstime $obstime
        #module unload python
        #module load python/anaconda-2021.05
        #python fit_draco_test.py $i temp.txt dracotest_$n'_'$inst.txt
        python fit_vdisp.py temp_$k.txt dracotest/dracotest_$n'_'$inst'_'$k.txt $nstar $obstime
    done
done

elapsed=$(( SECONDS - start_time ))

eval "echo Elapsed time: $(date -ud "@$elapsed" +'$((%s/3600/24)) days %H hr %M min %S sec')"

