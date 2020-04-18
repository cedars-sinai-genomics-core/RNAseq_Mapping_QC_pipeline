export PATH=/home/wangyiz/genomics/anaconda2/bin:$PATH
export PATH=/common/genomics-core/anaconda2/bin:$PATH
#INFILE=`awk '{print $1}' $3`
BAM="Aligned.toTranscriptome.out.bam"
COR="Aligned.sortedByCoord.out.bam"
INFILE=$3
#module load R
module load R/3.4.1
module load samtools

if [ "$1" = "Human_mRNA" ]; then

                #GENOMEPATH="/common/genomics-core/reference/STAR/primary_GRCh38_23"
                GENOMEPATH="/common/genomics-core/reference/STAR/primary_GRCh38_33"
                REFPATH="/common/genomics-core/reference/RseQC/GRCh38_v23/QC_reference_files.txt"
                #RSEMPATH="/common/genomics-core/reference/STAR/primary_GRCh38_23/GRCh38_primary"
                #RSEMPATH="/common/genomics-core/reference/STAR/primary_GRCh38_23/GRCh38_primary"
                RSEMPATH="/common/genomics-core/reference/STAR/primary_GRCh38_33/GRCh38_primary"

elif [ "$1" = "Mouse_mRNA" ]; then

                #GENOMEPATH="/common/genomics-core/reference/STAR/primary_GRCm38_mm8"
                GENOMEPATH="/common/genomics-core/reference/STAR/primary_GRCm38_mm24"
                REFPATH="/common/genomics-core/reference/RseQC/GRCm38_m8/QC_reference_files.txt"
                #RSEMPATH="/common/genomics-core/reference/STAR/primary_GRCm38_mm8/GRCm38_m8"
                RSEMPATH="/common/genomics-core/reference/STAR/primary_GRCm38_mm24/GRCm38_mm24"

elif [ "$1" = "Human_totalRNA" ]; then

                #GENOMEPATH="/common/genomics-core/reference/STAR/GRCh38_23_totalRNA"
                GENOMEPATH="/common/genomics-core/reference/STAR/GRCh38_33_totalRNA"
                REFPATH="/common/genomics-core/reference/RseQC/GRCh38_v23/QC_reference_files.txt"
                #RSEMPATH="/common/genomics-core/reference/STAR/GRCh38_23_totalRNA/GRCh38_23_totalRNA_ERCC92"
                RSEMPATH="/common/genomics-core/reference/STAR/GRCh38_33_totalRNA/GRCh38_33_totalRNA"

elif [ "$1" = "Mouse_totalRNA" ]; then

                #GENOMEPATH="/common/genomics-core/reference/STAR/GRCm38_M8_totalRNA"
                GENOMEPATH="/common/genomics-core/reference/STAR/GRCm38_M24_totalRNA"
                REFPATH="/common/genomics-core/reference/RseQC/GRCm38_m8/QC_reference_files.txt"
                #RSEMPATH="/common/genomics-core/reference/STAR/GRCm38_M8_totalRNA/GRCm38_M8_totalRNA"
                RSEMPATH="/common/genomics-core/reference/STAR/GRCm38_M24_totalRNA/GRCm38_M24_totalRNA"


elif [ "$1" = "Rat" ]; then

                GENOMEPATH="/common/genomics-core/reference/STAR/Rnor_6.0_Rat"
                REFPATH="/common/genomics-core/reference/RseQC/Rnor6.0/QC_reference_files.txt"
                RSEMPATH="/common/genomics-core/reference/STAR/Rnor_6.0_Rat/Rnor6"

elif [ "$1" = "Breunig" ]; then

        GENOMEPATH="/common/genomics-core/reference/STAR/Breunig_mouse_custom/Breunig_P2A_EGFP_Mir"
        REFPATH="/common/genomics-core/reference/RseQC/GRCm38_m8/QC_reference_files.txt"
        RSEMPATH="/common/genomics-core/reference/STAR/Breunig_mouse_custom/Breunig_P2A_EGFP_Mir"

elif [ "$1" = "Human_mRNA_hg19" ]; then

                GENOMEPATH="/common/genomics-core/reference/STAR/GRCh37"
                REFPATH="/common/genomics-core/reference/RseQC/GRCh37/QC_reference_files.txt"

elif [ "$1" = "test" ]; then
#               GENOMEPATH="/common/genomics-core/reference/Pipeline_test/GRCh38/STAR/"
#               REFPATH="/common/genomics-core/reference/Pipeline_test/GRCh38/RSEQC/QC_reference_files.txt"
                GENOMEPATH="/common/genomics-core/data/Collaboration/Ghiasi/SW-6382--02--15--2019/Genome/"
                REFPATH="/common/genomics-core/reference/RseQC/GRCm38_m8/QC_reference_files.txt"
else
        echo "Please perfomr alignment manually since no reference genome available"

fi

        if [ "$2" = "SE" ]; then
        echo $INFILE
        /common/genomics-core/bin/Rse_QC_pipeline.pl -i $INFILE$COR -t SE -d ./RseQC_results -p $INFILE -r $REFPATH

        echo "Done for RseQC!"

        elif [ "$2" = "PE" ]; then

        /common/genomics-core/bin/Rse_QC_pipeline.pl -i $INFILE$COR -t PE -d ./RseQC_results -p $INFILE -r $REFPATH

        echo "Done for RseQC!"

        fi
