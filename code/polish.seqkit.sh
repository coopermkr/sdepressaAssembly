#!/bin/bash
#SBATCH -e split_hap2%j.err
#SBATCH -o split_hap2%j.out
#SBATCH -c 10
#SBATCH --mem=16G
#SBATCH -p cpu
#SBATCH -n 1
#SBATCH -t 6:00:00

conda init bash

conda activate seqkit

seqkit grep -n -f hap1_headers.txt haps.polished.fasta > sdep.polished.hap1.fasta

seqkit grep -n -f hap2_headers.txt haps.polished.fasta > sdep.polished.hap2.fasta
