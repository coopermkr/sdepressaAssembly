#!/bin/bash
#SBATCH -o align_hic%j.out
#SBATCH -c 40
#SBATCH --mem=48G
#SBATCH -p cpu
#SBATCH -n 1
#SBATCH -t 24:00:00

# Method 1: BWA
module load bwa/0.7.17
bwa index 




#Align pacbio and nanopore reads against the reference using minimap
#module load minimap2/2.26+py3.8.12

#Index the reference once now to save time aligning multiple files later
#Comment out the line below after making the .mmi index file once
#minimap2 -t 40 -d ../../../2.alloAssembly/mod/putg.index.mmi ../../../2.alloAssembly/mod/allo.mod.3.putg.fasta
#echo indexDone


#Adding -a outputs a SAM file
#Adding -x lets you set presets to speed up alignments. Use this for long reads
#Instead of supplying a reference, we can supply our .mmi index to save time

#minimap2 -ax map-pb -t 40 ../../../2.alloAssembly/mod/putg.index.mmi ../../../data/pacm56.ccs.fastq > putg.pac.sam

minimap2 -ax map-ont -t 40 ../../../2.alloAssembly/mod/putg.index.mmi ../../../data/GSHC-1.nano.trimmed.fastq > putg.nano.sam

#For paired end reads, list the fastq one after the other, 
#minimap will assume they are paired-end if IDs match within the fastq
#minimap2 -a -t 40 ../../../2.alloAssembly/mod/putg.index.mmi ../../../data/HSHC_R1_trimmed.fastq ../../../data/HSHC_R2_trimmed.fastq > putg.hic.sam

echo done
