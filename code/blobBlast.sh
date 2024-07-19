#!/bin/bash
#SBATCH -c 20
#SBATCH -o blast_%j.out
#SBATCH --mem=96G
#SBATCH -p cpu
#SBATCH --nodes 1
#SBATCH -t 1-0

module load miniconda/4.11.0
conda activate blast
echo $in

#Make blast database from downloaded fasta files
makeblastdb -dbtype 'nucl' -in ../tetra/nt/*.fa 

# Blast assembly against nucleotide database
#blastn -db nt -query $in -num_threads 2 -outfmt "6 qseqid staxids bitscore std" -max_target_seqs 10 -max_hsps 1 -evalue 1e-25 -out $in.out

echo done
