#!/bin/bash
#SBATCH -o align_hic%j.out
#SBATCH -c 20
#SBATCH --mem=48G
#SBATCH -p cpu
#SBATCH -n 1
#SBATCH -t 12:00:00

indir=/project/pi_brook_moyers_umb_edu/salicornia/genomeAssembly/rawData

module load minimap2/2.26+py3.8.12
module load samtools/1.14
module load bedtools/2
module load BBMap/38.90

# Add /1 and /2 to paired end reads
reformat.sh in=$indir/HSHC_R1_trimmed.fastq in2=$indir/HSHC_R2_trimmed.fastq out1=renamed1.fastq out2=renamed2.fastq addslash

# Map reads against chloroplast genome
#minimap2 -t 20 -ax map-hifi bigchloro.fasta $indir/pacm56.ccs.fastq.gz > bigpac.sam

minimap2 -t 20 -a bigchloro.fasta renamed1.fastq renamed2.fastq > bighic.sam

# Convert sam to bam, drop unmapped reads, then sort
#samtools view -@ 20 -bF 4 bigpac.sam | samtools sort -@ 20 -n - > bigpac.sort.bam

samtools view -@ 20 -bF 4 bighic.sam | samtools sort -@ 20 -n - > bighic.sort.bam

# Convert bam to fastq
#bedtools bamtofastq -i bigpac.sort.bam -fq bigpac.fastq
bedtools bamtofastq -i bighic.sort.bam -fq bighic_R1.fastq -fq2 bighic_R2.fastq


