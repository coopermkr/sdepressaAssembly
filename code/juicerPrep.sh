#!/bin/bash
#SBATCH -e juicerPrep_%j.err
#SBATCH -o juicerPrep_%j.out
#SBATCH -c 10
#SBATCH --mem=10G
#SBATCH -p cpu
#SBATCH -n 1
#SBATCH -t 1:00:00

#Run juicer prep executable from home directory on hap1
/home/c_kimballrhines001_umb_edu/yahs/juicer pre -a -o hap1.JBAT ../yahs.hap1/yahs.out.bin ../yahs.hap1/yahs.out_scaffolds_final.agp ../indexing/sdep.polished.hap1.50k.fasta.fai > hap1.JBAT.log 2>&1

#Run juicer on hap2
/home/c_kimballrhines001_umb_edu/yahs/juicer pre -a -o hap2.JBAT ../yahs.hap2/yahs.out.bin ../yahs.hap2/yahs.out_scaffolds_final.agp ../indexing/sdep.polished.hap2.50k.fasta.fai > hap2.JBAT.log 2>&1
