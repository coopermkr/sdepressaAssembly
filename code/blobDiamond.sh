#!/bin/bash
#SBATCH -o diamond_%j.out
#SBATCH -c 30
#SBATCH --mem=96G
#SBATCH -p cpu-long
#SBATCH -n 2
#SBATCH -t 6-0

module load diamond/2.1.7+py2.7.18

#Align assembly against the database
diamond blastx --verbose --threads 60 --query $in --db ../reference_proteomes.dmnd --outfmt 6 qseqid staxids bitscore qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore --sensitive --max-target-seqs 1 --evalue 1e-25 > diamond.$in.out
