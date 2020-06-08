#!/bin/bash

## Job name:
#SBATCH --job-name=Spades_test
## Project:
#SBATCH --account=nnx
## Wall time limit:
#SBATCH --time=5:00
##Define array
#SBATCH --array=21,33,55,71
# Number of Nodes:
#SBATCH --nodes=1
#Cores per process
#SBATCH --cpus-per-task=4
# Amount of memory:
#SBATCH --mem-per-cpu=8G --partition=bigmem
# Email notifications
#SBATCH  --mail-type=TIME_LIMIT_50,END --mail-user=xx


## Set up job environment:
set -o errexit  # Exit the script on any error
set -o nounset  # Treat any unset variables as an error

## Load the modules
module --quiet purge  # Reset the modules to the system default
module load SPAdes/3.14.1-GCC-8.3.0-Python-3.7.4
module list

## Set variables 
export DATA_DIR="/cluster/software/SPAdes/3.14.1-GCC-8.3.0-Python-3.7.4/share/spades/test_dataset"
export OUTPUT_DIR="spades_1k_${SLURM_ARRAY_TASK_ID}"
let MEM_R=${SLURM_MEM_PER_CPU}*${SLURM_CPUS_PER_TASK}/1024;

## Run spades:
spades.py --pe1-1 "${DATA_DIR}/ecoli_1K_1.fq.gz" \
    --pe1-2 "${DATA_DIR}/ecoli_1K_2.fq.gz" \
    -k "${SLURM_ARRAY_TASK_ID}" \
    --careful --threads ${SLURM_CPUS_PER_TASK} \
    --memory  ${MEM_R} \
    -o ${OUTPUT_DIR}
