#!/bin/bash
#SBATCH -o tryCluster_%j.out
#SBATCH -c 20
#SBATCH --mem=96G
#SBATCH -p cpu
#SBATCH -n 1
#SBATCH -t 24:00:00

module load miniconda/4.11.0
conda activate trycycler

trycycler cluster -t 20 --assemblies assemblies/*.fasta --reads bigpac.fastq --out_dir trycycler
