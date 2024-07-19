#!/bin/bash
#SBATCH -e juicer_%j.err
#SBATCH -o juicer_%j.out
#SBATCH -c 20
#SBATCH --mem=192G
#SBATCH -p cpu
#SBATCH -n 1
#SBATCH -t 20:00:00

/home/c_kimballrhines001_umb_edu/yahs/juicer pre ../yahs.hap1/yahs.out.bin ../yahs.hap1/yahs.out_scaffolds_final.agp ../indexing/sdep.polished.hap1.50k.fasta.fai | sort -k2,2d -k6,6d -T ./ --parallel=20 -S64G | awk 'NF' > alignments_sorted.txt.part
