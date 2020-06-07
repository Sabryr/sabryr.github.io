

## Task 1: How does slurm work, and how to use it for spades 
(time frame: max 20 minutes)

### Explain briefly how slurm works. Include concepts such as queue, cpus, threads,  slurm job script, etc. 

[HPC basics](https://sabryr.github.io/hpc-intro-new/13-scheduler/index.html)

[Abel](https://www.youtube.com/watch?v=Hjf5t26TeDQ)

![On remote](https://sabryr.github.io/hpc-intro-new/fig/login_node.svg)

![Queue manager in resturent](https://sabryr.github.io/hpc-intro-new/fig/restaurant_queue_manager.svg)

### Explain how to set up a saga job script for the program SPAdes
# Download data
  - Illumina HiSeq  paired-end reads from E.coliO104:H4(strain TY-2482)(ENA SRR292770) 
  - https://www.ebi.ac.uk/ena/data/view/SRR292770&display=html

# SPAdes 
  - http://cab.spbu.ru/files/release3.14.1/manual.html
  - Data https://mra.asm.org/content/9/11/e00169-20
### Please include a discussion on commands that can be used to monitor a slurm job, and slurm commands that can be used to diagnose if we have allocated resources correctly.




## Task 2: Show and explain a larger coding project in which you have played a significant role (time frame: 20 minutes)

Possible projects:
https://github.com/Sabryr/bigsync
https://github.com/Sabryr/Transfer_scripts

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
