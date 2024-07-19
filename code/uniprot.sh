#!/bin/bash
#SBATCH -o uniprot_%j.out
#SBATCH -c 20
#SBATCH --mem=24G
#SBATCH -p cpu
#SBATCH -n 1
#SBATCH -t 24:00:00

#Set directory paths
TAXDUMP=/scratch/workspace/c_kimballrhines001_umb_edu-assembly/3.blobplot/taxonomy_2024.03.25
UNIPROT=uniprot

#Download and reformat uniprot references
wget -q -O $UNIPROT/reference_proteomes.tar.gz \
 ftp.ebi.ac.uk/pub/databases/uniprot/current_release/knowledgebase/reference_proteomes/$(curl \
     -vs ftp.ebi.ac.uk/pub/databases/uniprot/current_release/knowledgebase/reference_proteomes/ 2>&1 | \
     awk '/tar.gz/ {print $9}')
cd $UNIPROT
tar xf reference_proteomes.tar.gz


# if the step above fails because of a problem with downloading or untarring the file
# try replacing:
#    ftp.ebi.ac.uk/pub/databases/uniprot/current_release/knowledgebase/reference_proteomes/
# with:
#    ftp.expasy.org/databases/uniprot/current_release/knowledgebase/reference_proteomes/

#Make reference index
touch reference_proteomes.fasta.gz
find . -mindepth 2 | grep "fasta.gz" | grep -v 'DNA' | grep -v 'additional' | xargs cat >> reference_proteomes.fasta.gz

#Combine with taxon info to make taxIDs
printf "accession\taccession.version\ttaxid\tgi\n" > reference_proteomes.taxid_map
zcat */*/*.idmapping.gz | grep "NCBI_TaxID" | awk '{print $1 "\t" $1 "\t" $3 "\t" 0}' >> reference_proteomes.taxid_map

#Activate blast diamond to make a diamond database from the raw data
module load diamond/2.1.7+py2.7.18
diamond makedb -p 16 --in reference_proteomes.fasta.gz --taxonmap reference_proteomes.taxid_map --taxonnodes $TAXDUMP/nodes.dmp --taxonnames $TAXDUMP/names.dmp -d reference_proteomes.dmnd
cd -
