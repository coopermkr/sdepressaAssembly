#!/bin/bash
#SBATCH -e hifiasm_%j.err
#SBATCH -o hifiasm_%j.out
#SBATCH --job-name=hifiasm_tetra
#SBATCH -t 24:00:00
#SBATCH -p cpu
#SBATCH --mem=600G
#SBATCH -c 40
#SBATCH -n 1

path=/work/pi_brook_moyers_umb_edu/salicornia/genomeAssembly/data

#Run hifiasm
../exec/hifiasm -o tetra --n-hap 4 --hom-cov 93 --primary -s .35 --s-base .35 -t40 --h1 $path/HSHC_R1_trimmed.fastq --h2 $path/HSHC_R2_trimmed.fastq --ul $path/GSHC-1.nano.trimmed.fastq $path/pacm5.ccs.fastq $path/pacm6.ccs.fastq

#Convert assembly graphs to fasta
awk '/^S/{print ">"$2"\n"$3}' tetra.hic.hap1.p_ctg.gfa | fold > tetra.hap1.fasta
awk '/^S/{print ">"$2"\n"$3}' tetra.hic.hap2.p_ctg.gfa | fold > tetra.hap2.fasta
awk '/^S/{print ">"$2"\n"$3}' tetra.hic.hap3.p_ctg.gfa | fold > tetra.hap3.fasta
awk '/^S/{print ">"$2"\n"$3}' tetra.hic.hap4.p_ctg.gfa | fold > tetra.hap4.fasta

awk '/^S/{print ">"$2"\n"$3}' tetra.hic.p_utg.gfa | fold > tetra.utg.fasta

#Run assemblathon stats
module load perl-compress-raw-zlib/2.081

perl ../../scripts/assemblathon_stats.pl tetra.hap1.fasta > tetra.hap1.txt
perl ../../scripts/assemblathon_stats.pl tetra.hap2.fasta > tetra.hap2.txt
perl ../../scripts/assemblathon_stats.pl tetra.hap3.fasta > tetra.hap3.txt
perl ../../scripts/assemblathon_stats.pl tetra.hap4.fasta > tetra.hap4.txt

perl ../../scripts/assemblathon_stats.pl tetra.utg.fasta > tetra.utg.txt
