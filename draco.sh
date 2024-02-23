#!/usr/bin/env bash
# run outside of DarkMatter environment
# echo "Mock 1 (Segue 1)"

inst=IMACS

module unload python

for i in {1..2}
do

    for n in 0 0.5 1.0 1.5
    do
        echo vsys $n iteration $i
        module load python/anaconda-2020.02
        python ../dsphsim/simulator.py --stellar_mass 320000 --rhalf .196 --vmax 18.197 --rvmax 0.759 --distance 76 --kinematics Physical --vsys $n temp.txt --instrument $inst
        module unload python
        module load python/anaconda-2021.05 
        #python fit_draco_test.py $i temp.txt dracotest_$n'_'$inst.txt
        python fit_vdisp.py temp.txt dracotest_$n'_'$inst.txt
    done
done

