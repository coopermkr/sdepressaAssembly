#!/bin/bash
#SBATCH -o import_%j.out
#SBATCH -c 5
#SBATCH --mem=48G
#SBATCH -p cpu
#SBATCH -n 1
#SBATCH -t 24:00:00

#Unzip the proteomes
#tar -xf reference_proteomes.tar.gz

#Pull out fasta files
touch reference_proteomes.fasta.gz
find . -mindepth 2 | grep "fasta.gz" | grep -v 'DNA' | grep -v 'additional' | xargs cat >> reference_proteomes.fasta.gz

#Create taxID map
echo -e "accession\taccession.version\ttaxid\tgi" > reference_proteomes.taxid_map

zcat */*/*.idmapping.gz | grep "NCBI_TaxID" | awk '{print $1 "\t" $1 "\t" $3 "\t" 0}' >> reference_proteomes.taxid_map

#Create diamond database with taxonomy info from ncbi taxdump
diamond makedb -p 5 --in reference_proteomes.fasta.gz --taxonmap reference_proteomes.taxid_map --taxonnodes ../taxonomy_2024.03.25/nodes.dmp -d reference_proteomes.dmnd
