import sys
import numpy as np

data_path="dracoisssh.txt"
if len(sys.argv)>1:
    data_path=sys.argv[1]
outfile='draco_tessst.txt'
if len(sys.argv)>2:
    outfile=sys.argv[2]
nnn=np.nan
if len(sys.argv)>3:
    nnn=int(sys.argv[3])
obstime=3600
if len(sys.argv)>3:
    obstime=sys.argv[4]

sys.path.append('../dsphsim/')
from vdisp import medcall

dic,n= medcall(data_path,ncall=nnn,sort=False)
sigma=dic['sigma']

if n==nnn:
    with open(outfile,'a') as of:
        of.write(f'{sigma[0]:>6.3f} {sigma[1]:>6.3f} {sigma[2]:>6.3f} {n:>4} {obstime:>6}\n')

