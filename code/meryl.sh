#!/bin/bash
#SBATCH -o count_%j.out
#SBATCH -c 20
#SBATCH --mem=96G
#SBATCH -p cpu
#SBATCH -n 1
#SBATCH -t 24:00:00

indir=/project/pi_brook_moyers_umb_edu/salicornia/genomeAssembly/rawData

module load miniconda/4.11.0
conda activate merqury

meryl count threads=20 k=20 $indir/pac*.fastq.gz output pacbio.meryl
