#!/bin/bash
#SBATCH -e haphic_%j.err
#SBATCH -o haphic_%j.out
#SBATCH -c 1
#SBATCH --mem=24G
#SBATCH -p cpu
#SBATCH -n 1
#SBATCH -t 2:00:00

module load miniconda/22.11.1-1
conda activate haphic

../HapHiC/haphic plot --cmap viridis 04.build/scaffolds.raw.agp filtered.diphic.bam
