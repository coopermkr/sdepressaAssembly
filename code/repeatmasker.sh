#!/bin/bash
#SBATCH -o repeat_%j.out
#SBATCH -c 40
#SBATCH --mem=16G
#SBATCH -p cpu
#SBATCH -n 1
#SBATCH -t 24:00:00

# Load repeatmasker
module load hierarchy-island-fix/openmpi4.1.3+openblas0.3.18
module load repeatmasker/4.1.2-p1+py3.8.12

RepeatMasker -noisy -dir . -a --xsmall -html -gff -e hmmer -pa 20 -species viridiplantae ../6.polishing/tetra.n18.scaff/tetra.polished.fasta
