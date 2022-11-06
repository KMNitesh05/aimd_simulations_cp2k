#!/bin/bash
##SBATCH -A clark
#SBATCH -p clark,cas,kamiak
#SBATCH -J wat_vap
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --threads-per-core=1
#SBATCH --time=7-00:00:00

module load gcc/7.3.0
module load openmpi/3.0.0
#module load cp2k/6.1
#cp2kpath="/data/clark/maxime/cp2kbuild_/cp2kdev/exe/gfortran-openmpi-scalapack-plumed2-libint-libxc-elpa"
#export PATH="$cp2kpath:$PATH"

. /home/m.pouvreau/cp2k-prep/loadcp2k

pfx=$1
#pfx0="VOID"
#pbscp="F"
#tsk="opt"
#val[restart]="F"
#restcel=""
#val['method']="QS"
#
#if [ $pbscp == 'T' ]; then
#cp $pfx0.r $pfx.r
#if [ $method != 'FIST' ]; then
#cp $pfx0.w $pfx.w
#fi
#elif [ ${tsk:0:3} == 'nve' ]; then
#sed -E -i 's/@SET RESTVEL\s+F/@SET RESTVEL T/' $pfx.in
#fi
#if [ ${val[restart]} == 'T' ]; then
#sed -E -i 's/@SET RESTART\s+F/@SET RESTART T/' $pfx.in
#sed -E -i 's/@SET RESTVEL\s+F/@SET RESTVEL T/' $pfx.in
##      sed -E -i 's/@SET RESTWFN\s+F/@SET RESTWFN T/' $pfx.in
#fi
#if [ $restcel == 'T' ]; then
#sed -E -i 's/@SET RESTCEL\s+F/@SET RESTCEL T/' $pfx.in
#fi

cat $pfx.inp >> $pfx.out
srun cp2k.popt -i $pfx.inp -o $pfx.out

