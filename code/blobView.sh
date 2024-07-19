#!/bin/bash
#SBATCH -o view_%j.out
#SBATCH -c 4
#SBATCH --mem=48G
#SBATCH -p cpu
#SBATCH -n 1
#SBATCH -t 4:00:00

module load miniconda/4.11.0
conda deactivate
conda activate /work/pi_brook_moyers_umb_edu/conda/envs/blobtoolkit-env

#Run blobtools view with all three types of plots
#blobtools view --out figures tetra.utg
blobtools view --out figures --view cumulative tetra.utg
blobtools view --out figures --view snail tetra.utg
