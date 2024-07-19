#!/bin/bash
#SBATCH -o subphaser_%j.out
#SBATCH -c 20
#SBATCH --mem=96G
#SBATCH -p cpu
#SBATCH -n 1
#SBATCH -t 12:00:00

module load miniconda/22.11.1-1
conda activate SubPhaser

subphaser -k 13 -i ../../4.scaffolding/tetra/n18/04.build/tetra.scaff.top18.fasta -c final.config
