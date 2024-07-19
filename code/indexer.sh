#!/bin/bash
#SBATCH -o index_%j.out
#SBATCH -c 1
#SBATCH --mem=10G
#SBATCH -p cpu
#SBATCH -n 1
#SBATCH -t 24:00:00

#module load bwa/0.7.17
#bwa index -a bwtsw ../indexing/*hap2*.fasta
#bwa index -t 20 -a bwtsw tetra.utg.pac.bam

module load samtools/1.14
#samtools faidx /scratch/workspace/c_kimballrhines001_umb_edu-sdscaffold/indexing/sdep.polished.hap2.50k.fasta
#samtools faidx -@ 20 tetra.utg.pac.bam
samtools index -c tetra.utg.pac.bam
