#!/bin/bash
#SBATCH -e haphic_%j.err
#SBATCH -o haphic_%j.out
#SBATCH -c 10
#SBATCH --mem=24G
#SBATCH -p cpu
#SBATCH -n 1
#SBATCH -t 2:00:00

module load miniconda/22.11.1-1
conda activate haphic

# Use gfa coverage depth to filter out collapsed contigs
# No need to adjust RE cut sequence bc default is DpnII
../HapHiC/haphic pipeline ../../2.hifiasm/tetra/tetra.utg.fasta filtered.tetrahic.bam 36 --gfa ../../2.hifiasm/tetra/tetra.hic.p_utg.gfa
