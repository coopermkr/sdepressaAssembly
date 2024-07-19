#!/bin/bash
#SBATCH -o merqury_%j.out
#SBATCH -c 20
#SBATCH --mem=96G
#SBATCH -p cpu
#SBATCH -n 1
#SBATCH -t 24:00:00

# Load merqury environment
module load miniconda/4.11.0
conda activate merqury

# Load dependencies
module load samtools/1.14
module load bedtools2/2.30.0+py3.8.12
module load java/11.0.2
module load openjdk/11.0.12_7

merqury.sh ../pacbio.meryl ../../5.subphaser/final/a.blue.fa ../../5.subphaser/final/a.gold.fa phased.scaff
