#!/bin/bash
#SBATCH -o synteny_scaffs%j.out
#SBATCH -c 25
#SBATCH --mem=384G
#SBATCH -p cpu
#SBATCH -n 1
#SBATCH -t 6:00:00

ramo=/work/pi_brook_moyers_umb_edu/salicornia/genomeAssembly/data/sRamos.fasta

#Align pacbio and nanopore reads against the reference using minimap
module load minimap2/2.26+py3.8.12

#Align diploid unitig scaffolds against Ramosissima
minimap2 -cx asm10 -t 25 ../../3.scaffolding/dip/n36/04.build/dip.scaff.top36.fasta ../../3.scaffolding/dip/n18/04.build/dip.scaff.top18.fasta > ds36ds18.paf

minimap2 -cx asm10 -t 25 ../../3.scaffolding/dip/n36/04.build/dip.scaff.top36.fasta ../../3.scaffolding/tetra/n18/04.build/tetra.scaff.top18.fasta > ds36ts18.paf

minimap2 -cx asm10 -t 25 ../../3.scaffolding/dip/n36/04.build/dip.scaff.top36.fasta ../../3.scaffolding/tetra/n36/04.build/tetra.scaff.top36.fasta > ds36ts36.paf

minimap2 -cx asm10 -t 25 ../../3.scaffolding/tetra/n36/04.build/tetra.scaff.top36.fasta ../../3.scaffolding/tetra/n18/04.build/tetra.scaff.top18.fasta > ts36ts18.paf
