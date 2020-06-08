

# Task 1: How does slurm work, and how to use it for spades 
(time frame: max 20 minutes)

### Explain briefly how slurm works. Include concepts such as queue, cpus, threads,  slurm job script, etc. 

[HPC basics](https://sabryr.github.io/hpc-intro-new/13-scheduler/index.html)

[Abel](https://www.youtube.com/watch?v=Hjf5t26TeDQ)

![On remote](https://sabryr.github.io/hpc-intro-new/fig/login_node.svg)

![Queue manager in resturent](https://sabryr.github.io/hpc-intro-new/fig/restaurant_queue_manager.svg)

### Explain how to set up a saga job script for the program SPAdes
#### SPAdes 
[SPAdes manual](http://cab.spbu.ru/files/release3.14.1/manual.html)

#### data
/cluster/software/SPAdes/3.14.1-GCC-8.3.0-Python-3.7.4/share/spades/test_dataset

#### Job script
[Saga documentation] (https://documentation.sigma2.no/jobs/job_scripts/saga_job_scripts.html)

```
#!/bin/bash

##Job name:
#SBATCH --job-name=Spades_test
##Project:
#SBATCH --account=nnxxxxk
##Wall time limit:
#SBATCH --time=1:10:00
#Number of Nodes:
#SBATCH --nodes=1
#Number of cores:
##SBATCH --ntasks=4
#SBATCH --cpus-per-task=4
#Amount of memory:
#SBATCH --mem-per-cpu=16G


##Set up job environment:
set -o errexit  # Exit the script on any error
set -o nounset  # Treat any unset variables as an error

##Load the modules
module --quiet purge  # Reset the modules to the system default
module load SPAdes/3.14.1-GCC-8.3.0-Python-3.7.4
module list

##Set variables
export DATA_DIR="/cluster/software/SPAdes/3.14.1-GCC-8.3.0-Python-3.7.4/share/spades/test_dataset"
export OUTPUT_DIR="spades_1k_2"
let MEM_R=${SLURM_MEM_PER_CPU}*${SLURM_CPUS_PER_TASK}/1024;

##Run spades:
spades.py --pe1-1 "${DATA_DIR}/ecoli_1K_1.fq.gz" \
    --pe1-2 "${DATA_DIR}/ecoli_1K_2.fq.gz" \
    --careful --threads ${SLURM_CPUS_PER_TASK} \
    --memory  ${MEM_R} \
    -o ${OUTPUT_DIR}

```
{: .bash}


### How to monitor jobs  
Please include a discussion on commands that can be used to monitor a slurm job,   
and slurm commands that can be used to diagnose if we have allocated resources correctly.

```
squeue -u $USER
scontrol show job <JOBID>
sacct -j  <JOBID>
ssh <compute_node>

```
{: .bash}


## Task 2: Show and explain a larger coding project in which you have played a significant role (time frame: 20 minutes)

Possible projects:
[Publication list](https://scholar.google.com/citations?user=3nSAUFsAAAAJ)

1. [EGDMS Java/Javascript/SQL/Python](https://github.com/Sabryr/EGDMS)
   1. [eGenVar](http://bigr.medisin.ntnu.no/data/eGenVar/home.html)
2. [AUS 1, R/Fortran/Bash](https://github.com/Sabryr/Pmetrics_test)
3. [Bigsync bash](https://github.com/Sabryr/bigsync)
4. [Big File transfer bash](https://github.com/Sabryr/Transfer_scripts)
5. [Tavtar Pythn/Bash/Google-scripting](https://github.com/Sabryr/Tavatar)


### The coding team, and who did what
### The problem that the code was supposed to solve
### Code architecture
### The development process
### Big choices made along the way (both yours, and the teams)
### Mistakes along the way, and how they were fixed (both yours, and the teams)
### What would you have wanted to change, based on what you know now.
### Please note: we would like to see some code


## Extra details
### Contigs 
are continuous stretches of sequence containing only A, C, G, or T bases without gaps

### Scaffolds 
are created by chaining contigs together using additional information about the relative 
position and orientation of the contigs in the genome. Contigs in a scaffold are separated
by gaps, which are designated by a variable number of ‘N’ letters. Scaffolding is often
used for short-read assemblies to make sense of the fragmented genome assemblies containing
short contigs. However, there are three important principal deficiencies of scaffolds:
