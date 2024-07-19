#!/bin/bash
#SBATCH -o trymsa_%j.out
#SBATCH -c 20
#SBATCH --mem=12G
#SBATCH -p cpu
#SBATCH -n 1
#SBATCH -t 24:00:00

module load miniconda/4.11.0
conda activate trycycler

cl=002

#These steps don't need intervention, so we can run them all sequentially after setting cluster number
trycycler msa -t 20 --cluster_dir trycycler/cluster_$cl

trycycler partition -t 20 --reads bigpac.fastq --cluster_dirs trycycler/cluster_$cl

trycycler consensus -t 20 --cluster_dir trycycler/cluster_$cl

