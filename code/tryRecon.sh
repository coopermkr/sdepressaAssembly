#!/bin/bash
#SBATCH -o tryReconcile_%j.out
#SBATCH -c 20
#SBATCH --mem=24G
#SBATCH -p cpu
#SBATCH -n 1
#SBATCH -t 24:00:00

module load miniconda/4.11.0
conda activate trycycler

#trycycler reconcile --verbose -t 20 --max_add_seq_percent 10 --max_trim_seq_percent 15 --reads bigpac.fastq --cluster_dir trycycler/cluster_001
trycycler reconcile -t 20 --reads bigpac.fastq --cluster_dir trycycler/cluster_001
trycycler reconcile -t 20 --reads bigpac.fastq --cluster_dir trycycler/cluster_002
#trycycler reconcile -t 20 --reads bigpac.fastq --cluster_dir trycycler/cluster_006
