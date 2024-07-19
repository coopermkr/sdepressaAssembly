#!/bin/bash
#SBATCH -e hicAlign_%j.err
#SBATCH -o hicAlign_%j.out
#SBATCH -c 30
#SBATCH --mem=48G
#SBATCH -p cpu
#SBATCH -n 1
#SBATCH -t 12:00:00

hic1=/work/pi_brook_moyers_umb_edu/salicornia/genomeAssembly/data/HSHC_R1_trimmed.fastq
hic2=/work/pi_brook_moyers_umb_edu/salicornia/genomeAssembly/data/HSHC_R2_trimmed.fastq

module load bwa/0.7.17
module load samtools/1.14

module load miniconda/22.11.1-1
conda activate haphic

#Aligning HiC reads against unitigs
#bwa index ../../2.hifiasm/tetra/tetra.utg.fasta
#bwa mem -t 30 -5SP ../../2.hifiasm/tetra/tetra.utg.fasta $hic1 $hic2 | ../samblaster/samblaster | samtools view - -@ 30 -S -h -b -F 3340 -o tetrahic.bam

# Filter alignments with MAPQ1 and NM3
../HapHiC/utils/filter_bam tetrahic.bam 1 --nm 3 --threads 30 | samtools view - -b -@ 30 -o filtered.tetrahic.bam
