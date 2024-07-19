#!/bin/bash
#SBATCH -c 20
#SBATCH --mem=96G
#SBATCH -p cpu
#SBATCH -n 1
#SBATCH -t 24:00:00

module load python/3.8.12
module load SPAdes/3.15.1
module load racon/1.4.3+py2.7.18
module load blast-plus/2.13.0+py3.8.12

unicycler --verbosity 2 -t 20 -l ${1} -o out.${1}/
