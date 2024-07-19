#!/bin/bash
#SBATCH -o all_%j.out
#SBATCH -c 2
#SBATCH --mem=48G
#SBATCH -p cpu
#SBATCH -n 1
#SBATCH -t 24:00:00

module load miniconda/4.11.0
conda deactivate
conda activate /work/pi_brook_moyers_umb_edu/conda/envs/blobtoolkit-env

blobtools create --fasta tetra.utg.fasta --meta tetra.utg.yaml --taxid 549776 \
--taxdump ../taxonomy_2024.03.25 \
--hits ../databases/tetra.utg.diamond.blastx.out --taxrule bestsumorder \
--cov tetra.utg.pac.bam \
--busco ../../7.busco/tetra.uni/run_eudicots_odb10/tetra.utg.busco.eudicot_odb10.full_summary.tsv \
tetra.utg
