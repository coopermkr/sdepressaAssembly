#!/bin/bash
#SBATCH -c 4
#SBATCH --mem=10000
#SBATCH -p cpu
#SBATCH -t 03:00:00
#SBATCH -o slurm-%j.out

module load fastqc/0.11.9

fastqc --threads 4 ../data/isoseq/*.fastq.gz
