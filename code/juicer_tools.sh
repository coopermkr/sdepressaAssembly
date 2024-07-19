#!/bin/bash
#SBATCH -e juicer_tools_%j.err
#SBATCH -o juicer_tools_%j.out
#SBATCH -c 33
#SBATCH --mem=96G
#SBATCH -p cpu
#SBATCH -n 1
#SBATCH -t 20:00:00

module load java/11.0.2

#Test data set
#java -Xms512m -Xmx2048m -jar /home/c_kimballrhines001_umb_edu/juicer_tools/juicer_tools.jar pre test.txt.gz test.hic hg19

#Command copied from hap1.JBAT.log with hardcoded path to juicer_tools.jar
#java -Xmx36G -jar /home/c_kimballrhines001_umb_edu/juicer_tools/juicer_tools.jar pre --threads 33 hap1.JBAT.txt hap1.JBAT.hic chrom.size.hap1

#Command from hap2.JBAT.log
#java -Xmx36G -jar /home/c_kimballrhines001_umb_edu/juicer_tools/juicer_tools.jar pre hap2.JBAT.txt --threads 33 hap2.JBAT.hic chrom.size.hap2

#Command for juicer.yahs hap1
(java -jar -Xmx32G /home/c_kimballrhines001_umb_edu/juicer_tools/juicer_tools.jar pre alignments_sorted.txt out.hic.part chrom.size.hap1) && (mv out.hic.part hap1.hic)
