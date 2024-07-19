#!/bin/bash
#BSUB -q short
#BSUB -W 6:00
#BSUB -e trim.err
#BSUB -n 2
#BSUB -R rusage[mem=4096]
#BSUB -u c.kimballrhines001@umb.edu
#BSUB -B
#BSUB -N

cutadapt -j 2 -u 1 -a GATCCACT -o HSHC_R1_trimmed.fastq HSHC_1_S1_L001_R1_001.fastq
fastqc HSHC_R1_trimmed.fastq
