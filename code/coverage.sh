#!/bin/bash
#SBATCH -o coverage_%j.out
#SBATCH -c 1
#SBATCH --mem=96G
#SBATCH -p cpu
#SBATCH -n 1
#SBATCH -t 4:00:00

#Get depth statistics at each locus for a bam file
module load samtools/1.14

samtools depth sorted.ts18.pac.bam > ts18.pac.coverage.txt

echo done
