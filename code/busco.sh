#!/bin/bash
#SBATCH -c 10
#SBATCH --mem=12000
#SBATCH -p cpu
#SBATCH -o polished_%j.out
#SBATCH -t 24:00:00

module load miniconda/22.11.1-1
conda activate busco

#Run against subphased blue scaffolds
busco -c 10 -i ../6.polishing/tetra.n18.scaff/tetra.polished.fasta -l eudicots_odb10 -o polished -m genome

