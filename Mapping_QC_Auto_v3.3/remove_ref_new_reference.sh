#########################################################################
# File Name: remove_ref.sh
# Author: Yizhou Wang
# mail: yizhou@cshs.org
# Created Time: Fri 02 Sep 2016 02:04:16 PM PDT
#########################################################################
#!/bin/bash

export PATH=/stf/home/cluster/GenomicsCore/bin:$PATH
export LD_LIBRARY_PATH=/stf/home/cluster/GenomicsCore/lib/Python-2.7.3/lib:$LD_LIBRARY_PATH
export PATH=/stf/home/cluster/GenomicsCore/bin:$PATH
export PATH=/common/genomics-core/anaconda2/bin:$PATH
export PYTHONPATH=/stf/home/cluster/GenomicsCore/lib/Python-2.7.3/bin/:$PYTHONPATH

export LD_LIBRARY_PATH=/stf/home/cluster/GenomicsCore/lib/Python-2.7.3/lib:$LD_LIBRARY_PATH

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
#               GENOMEPATH="/common/genomics-core/reference/Pipeline_test/GRCh38/STAR/"
                REFPATH="/common/genomics-core/reference/Pipeline_test/GRCh38/RSEQC/QC_reference_files.txt"
                GENOMEPATH="/common/genomics-core/data/Collaboration/Ghiasi/SW-6382--02--15--2019/Genome"


elif [ "$1" = "Breunig" ]; then

GENOMEPATH="/common/genomics-core/reference/STAR/Breunig_mouse_custom/Breunig_P2A_EGFP_Mir"
        REFPATH="/common/genomics-core/reference/RseQC/GRCm38_m8/QC_reference_files.txt"

elif [ "$1" = "Human_mRNA_hg19" ]; then

                GENOMEPATH="/common/genomics-core/reference/STAR/GRCh37"
                REFPATH="/common/genomics-core/reference/RseQC/GRCh37/QC_reference_files.txt"

else
        echo "Please perfomr alignment manually since no reference genome available"

fi


/common/genomics-core/anaconda2/bin/STAR --genomeDir $GENOMEPATH --genomeLoad Remove --outFileNamePrefix $2

echo "ref genome has been removed"
