#!/bin/bash
#SBATCH -o subset_%j.out
#SBATCH -c 2
#SBATCH --mem=5G
#SBATCH -p cpu
#SBATCH -n 1
#SBATCH -t 2:00:00

module load seqtk/1.3

for i in $(seq 1 10);
do
   echo $i
   
   seqtk sample -s $i ../bigpac.fastq 10000 > bigpac.sub$i.fastq

   i=i+1
done


