#!/bin/bash
#SBATCH -c 10
#SBATCH --mem=10000
#SBATCH -p cpu
#SBATCH -t 4:00:00
#SBATCH -o blast%j.out

module load blast-plus/2.12.0

blastn -db nt -query bottomLeft.txt -out bottomLeft.out -remote
