#!/bin/bash
########singlecell-rnaseq-single end data#########
# To be used as a single scheduled job
# NOT in an array job
# arguments
# 1 Genome
# 2 SE or PE
# 3 INFILE
set -x

export PATH=/home/wangyiz/genomics/anaconda2/bin:$PATH
export PATH=/common/genomics-core/anaconda2/bin:$PATH

#INFILE=`awk '{print $1}' $3`

#PREFIX=`sed 's/.fastq//' $INFILE`
if [ "$1" = "Human_mRNA" ]; then

		#GENOMEPATH="/common/genomics-core/reference/STAR/primary_GRCh38_23"
                GENOMEPATH="/common/genomics-core/reference/STAR/primary_GRCh38_33"
		REFPATH="/common/genomics-core/reference/RseQC/GRCh38_v23/QC_reference_files.txt"

elif [ "$1" = "Mouse_mRNA" ]; then

       	        #GENOMEPATH="/common/genomics-core/reference/STAR/primary_GRCm38_mm8"
                GENOMEPATH="/common/genomics-core/reference/STAR/primary_GRCm38_mm24"
		REFPATH="/common/genomics-core/reference/RseQC/GRCm38_m8/QC_reference_files.txt"

elif [ "$1" = "Human_totalRNA" ]; then

                #GENOMEPATH="/common/genomics-core/reference/STAR/GRCh38_23_totalRNA"
                GENOMEPATH="/common/genomics-core/reference/STAR/GRCh38_33_totalRNA"
                REFPATH="/common/genomics-core/reference/RseQC/GRCh38_v23/QC_reference_files.txt"

elif [ "$1" = "Mouse_totalRNA" ]; then

                #GENOMEPATH="/common/genomics-core/reference/STAR/GRCm38_M8_totalRNA"
                GENOMEPATH="/common/genomics-core/reference/STAR/GRCm38_M24_totalRNA"
                REFPATH="/common/genomics-core/reference/RseQC/GRCm38_m8/QC_reference_files.txt"

elif [ "$1" = "Rat" ]; then

                GENOMEPATH="/common/genomics-core/reference/STAR/Rnor_6.0_Rat"
                REFPATH="/common/genomics-core/reference/RseQC/Rnor6.0/QC_reference_files.txt"

elif [ "$1" = "test" ]; then
#		GENOMEPATH="/common/genomics-core/reference/Pipeline_test/GRCh38/STAR/"
       		REFPATH="/common/genomics-core/reference/Pipeline_test/GRCh38/RSEQC/QC_reference_files.txt"
		GENOMEPATH="/common/genomics-core/data/Collaboration/Ghiasi/SW-6382--02--15--2019/Genome/"


elif [ "$1" = "Breunig" ]; then

	GENOMEPATH="/common/genomics-core/reference/STAR/Breunig_mouse_custom/Breunig_P2A_EGFP_Mir"
        REFPATH="/common/genomics-core/reference/RseQC/GRCm38_m8/QC_reference_files.txt"

elif [ "$1" = "Human_mRNA_hg19" ]; then

                GENOMEPATH="/common/genomics-core/reference/STAR/GRCh37"
                REFPATH="/common/genomics-core/reference/RseQC/GRCh37/QC_reference_files.txt"

else
        echo "Please perform alignment manually since no reference genome available"

fi

INFILE=$3

        if [ "$2" = "SE" ]; then
        echo $INFILE
        /common/genomics-core/anaconda2/bin/STAR --genomeDir $GENOMEPATH  --outSAMmode Full --readFilesCommand zcat --outSAMunmapped Within  --outFilterType Normal  --outSAMattributes All --outFilterMultimapNmax 20  --outFilterMismatchNmax 999  --outFilterMismatchNoverLmax 0.04  --alignIntronMin 20  --alignIntronMax 1000000  --alignMatesGapMax 1000000  --alignSJoverhangMin 8  --alignSJDBoverhangMin 1  --sjdbScore 1  --runThreadN 10 --genomeLoad LoadAndKeep --limitBAMsortRAM 10000000002 --outSAMtype BAM SortedByCoordinate  --quantMode TranscriptomeSAM --outFileNamePrefix $INFILE --readFilesIn $INFILE.fastq
#        /common/genomics-core/anaconda2/bin/STAR --genomeDir $GENOMEPATH  --outSAMmode Full --readFilesCommand zcat --outFilterScoreMinOverLread 0.3 --outFilterMatchNminOverLread 0.3 --outSAMunmapped Within  --outFilterType Normal  --outSAMattributes All --outFilterMultimapNmax 20  --outFilterMismatchNmax 999  --outFilterMismatchNoverLmax 0.04  --alignIntronMin 20  --alignIntronMax 1000000  --alignMatesGapMax 1000000  --alignSJoverhangMin 8  --alignSJDBoverhangMin 1  --sjdbScore 1  --runThreadN 10 --genomeLoad LoadAndKeep --limitBAMsortRAM 10000000002 --outSAMtype BAM SortedByCoordinate  --quantMode TranscriptomeSAM --outFileNamePrefix $INFILE --readFilesIn $INFILE.fastq

        echo "Done for mapping!"

        elif [ "$2" = "PE" ]; then

#        /common/genomics-core/anaconda2/bin/STAR --genomeDir $GENOMEPATH  --outSAMmode Full --outSAMunmapped Within --readFilesCommand zcat --outFilterType Normal  --outSAMattributes All --outFilterMultimapNmax 20  --outFilterMismatchNmax 999  --outFilterMismatchNoverLmax 0.04  --alignIntronMin 20  --alignIntronMax 1000000  --alignMatesGapMax 1000000  --alignSJoverhangMin 8  --alignSJDBoverhangMin 1  --sjdbScore 1  --runThreadN 7 --genomeLoad LoadAndKeep --limitBAMsortRAM 45000000000 --outSAMtype BAM SortedByCoordinate  --quantMode TranscriptomeSAM --outFileNamePrefix $INFILE --readFilesIn $INFILE.R1.fastq $INFILE.R2.fastq
        /common/genomics-core/anaconda2/bin/STAR --genomeDir $GENOMEPATH  --outSAMmode Full --outSAMunmapped Within --readFilesCommand zcat --outFilterMatchNminOverLread 0.3 --outFilterScoreMinOverLread 0.3 --outFilterType Normal  --outSAMattributes All --outFilterMultimapNmax 20  --outFilterMismatchNmax 999  --outFilterMismatchNoverLmax 0.04  --alignIntronMin 20  --alignIntronMax 1000000  --alignMatesGapMax 1000000  --alignSJoverhangMin 8  --alignSJDBoverhangMin 1  --sjdbScore 1  --runThreadN 8 --genomeLoad LoadAndKeep --limitBAMsortRAM 45000000000 --outSAMtype BAM SortedByCoordinate  --quantMode TranscriptomeSAM --outFileNamePrefix $INFILE --readFilesIn $INFILE.R1.fastq $INFILE.R2.fastq

        echo "Done for mapping!"

        fi





