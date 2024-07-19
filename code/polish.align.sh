#!/bin/bash
#SBATCH -o minimap_%j.out
#SBATCH -c 20
#SBATCH --mem=96G
#SBATCH -p cpu
#SBATCH -n 1
#SBATCH -t 24:00:00

module load minimap2/2.26+py3.8.12

# Align pacbio reads against n18 tetra scaffolds
minimap2 -ax map-pb -t 20 /scratch/workspace/c_kimballrhines001_umb_edu-assembly/4.scaffolding/tetra/n18/04.build/tetra.scaff.18.fasta /work/pi_brook_moyers_umb_edu/salicornia/genomeAssembly/data/pacm56.ccs.fastq > ts18.pac.sam

