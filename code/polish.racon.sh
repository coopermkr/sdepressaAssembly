#!/bin/bash
#SBATCH -o racon_%j.out
#SBATCH -c 20
#SBATCH --mem=192G
#SBATCH -p cpu
#SBATCH -n 1
#SBATCH -t 24:00:00

../racon/build/bin/racon -t 20 /work/pi_brook_moyers_umb_edu/salicornia/genomeAssembly/data/pacm56.ccs.fastq ts18.pac.sam tetra.scaff.18.fasta > tetra.polished.fasta

#../racon/build/bin/racon -t 40 ../../data/pacm56.ccs.fastq utg.paf ../../2.hifiasm/allo.mod.3.putg.fasta > uni.polished.fasta
