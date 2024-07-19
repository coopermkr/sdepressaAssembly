#!/bin/bash
#SBATCH -o blobAlign%j.out
#SBATCH -c 40
#SBATCH --mem=96G
#SBATCH -p cpu
#SBATCH -n 1
#SBATCH -t 24:00:00

path=/work/pi_brook_moyers_umb_edu/salicornia/genomeAssembly/data

#module load minimap2/2.26+py3.8.12
module load samtools/1.14

#minimap2 -ax map-pb -t 40 tetra.utg.fasta $path/pacm56.ccs.fastq > tetra.utg.sam

samtools view -@40 -Sb tetra.utg.sam | samtools sort -@40 -o tetra.utg.bam -

