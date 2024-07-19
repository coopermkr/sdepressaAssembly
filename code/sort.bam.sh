#!/bin/bash
#SBATCH -o sort.nano_%j.out
#SBATCH -c 20
#SBATCH --mem=25G
#SBATCH -p cpu
#SBATCH -n 1
#SBATCH -t 4:00:00

#Sort BAM file with samtools
module load samtools/1.14

haplo=hap1
dataType=nano

#Convert the aligned sam to bam
#samtools view -@ 20 -Sb -o $haplo.$dataType.bam $haplo.$dataType.sam

#Sort the reads in the bam file
samtools sort -@ 20 -O bam -o sorted.ts18.pac.bam ts18.pac.bam

#Mark duplicates in the sorted bam file
#samtools markdup -s -@ 20 sorted.$haplo.$dataType.bam dup.$haplo.$dataType.bam

#Index the bam file
samtools index sorted.ts18.pac.bam

echo done
