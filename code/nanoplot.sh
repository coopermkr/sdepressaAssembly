#!/bin/bash
#SBATCH -o pac_%j.out
#SBATCH -c 20
#SBATCH --mem=96G
#SBATCH -p cpu
#SBATCH -n 1
#SBATCH -t 24:00:00

indir=/project/pi_brook_moyers_umb_edu/salicornia/genomeAssembly/rawData

module load miniconda/4.11.0
conda activate nanoplot

NanoPlot -t 20 --verbose --store --fastq $indir/pacm*.fastq.gz -p pac --N50 --title pacbioReads --plots hex dot kde
