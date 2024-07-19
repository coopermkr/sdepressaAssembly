#!/bin/bash
#SBATCH -o tryAssemblies%j.out
#SBATCH -c 10
#SBATCH --mem=24G
#SBATCH -p cpu
#SBATCH -n 1
#SBATCH -t 24:00:00

export PATH="/work/pi_brook_moyers_umb_edu/salicornia/genomeAssembly/9.chloroplast/any2fasta:$PATH"
echo $PATH

module load py-flye/2.9+py3.8.12
module load racon/1.4.3+py2.7.18
module load minimap2/2.26+py3.8.12
module load miniasm/2018-3-30

threads=10  # change as appropriate for your system
mkdir assemblies

# Create assemblies with flye
#flye -g 150000 --pacbio-hifi read_subsets/unique_01.fastq --threads "$threads" --out-dir assembly_01 && cp assembly_01/assembly.fasta assemblies/assembly_01.fasta && cp assembly_01/assembly_graph.gfa assemblies/assembly_01.gfa && rm -r assembly_01
#flye -g 150000 --pacbio-hifi read_subsets/unique_04.fastq --threads "$threads" --out-dir assembly_04 && cp assembly_04/assembly.fasta assemblies/assembly_04.fasta && cp assembly_04/assembly_graph.gfa assemblies/assembly_04.gfa && rm -r assembly_04
#flye -g 150000 --pacbio-hifi read_subsets/unique_07.fastq --threads "$threads" --out-dir assembly_07 && cp assembly_07/assembly.fasta assemblies/assembly_07.fasta && cp assembly_07/assembly_graph.gfa assemblies/assembly_07.gfa && rm -r assembly_07
#flye -g 150000 --pacbio-hifi read_subsets/unique_10.fastq --threads "$threads" --out-dir assembly_10 && cp assembly_10/assembly.fasta assemblies/assembly_10.fasta && cp assembly_10/assembly_graph.gfa assemblies/assembly_10.gfa && rm -r assembly_10
flye -g 150000 --pacbio-hifi read_subsets/unique_02.fastq --threads "$threads" --out-dir assembly_02 && cp assembly_02/assembly.fasta assemblies/assembly_02.fasta && cp assembly_02/assembly_graph.gfa assemblies/assembly_02.gfa && rm -r assembly_02
flye -g 150000 --pacbio-hifi read_subsets/unique_12.fastq --threads "$threads" --out-dir assembly_12 && cp assembly_12/assembly.fasta assemblies/assembly_12.fasta && cp assembly_12/assembly_graph.gfa assemblies/assembly_12.gfa && rm -r assembly_12

echo flye done

# Create assemblies with minipolish
#Minipolish/miniasm_and_minipolish.sh read_subsets/sample_02.fastq "$threads" > assemblies/assembly_02.gfa && any2fasta assemblies/assembly_02.gfa > assemblies/assembly_02.fasta
#Minipolish/miniasm_and_minipolish.sh read_subsets/sample_05.fastq "$threads" > assemblies/assembly_05.gfa && any2fasta assemblies/assembly_05.gfa > assemblies/assembly_05.fasta
#Minipolish/miniasm_and_minipolish.sh read_subsets/sample_08.fastq "$threads" > assemblies/assembly_08.gfa && any2fasta assemblies/assembly_08.gfa > assemblies/assembly_08.fasta
#Minipolish/miniasm_and_minipolish.sh read_subsets/sample_11.fastq "$threads" > assemblies/assembly_11.gfa && any2fasta assemblies/assembly_11.gfa > assemblies/assembly_11.fasta

#echo miniasm done

# Create assemblies with raven
#raven/build/bin/raven --threads "$threads" --disable-checkpoints --graphical-fragment-assembly assemblies/assembly_03.gfa read_subsets/sample_03.fastq > assemblies/assembly_03.fasta
#raven/build/bin/raven --threads "$threads" --disable-checkpoints --graphical-fragment-assembly assemblies/assembly_06.gfa read_subsets/sample_06.fastq > assemblies/assembly_06.fasta
#raven/build/bin/raven --threads "$threads" --disable-checkpoints --graphical-fragment-assembly assemblies/assembly_09.gfa read_subsets/sample_09.fastq > assemblies/assembly_09.fasta
#raven/build/bin/raven --threads "$threads" --disable-checkpoints --graphical-fragment-assembly assemblies/assembly_12.gfa read_subsets/sample_12.fastq > assemblies/assembly_12.fasta

#echo raven done
