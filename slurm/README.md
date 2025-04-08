# Example Slurm scripts

These are examples of how to setup a slurm job on CCR's clusters. Refer to our documentation on [running and monitoring jobs](https://docs.ccr.buffalo.edu/en/latest/hpc/jobs/) for detailed information.  These examples supplement the documentation.  It's important to understand the concepts of batch computing and CCR's specific cluster use and limits prior to using these examples.

## Get Started

At CCR you should use the bash shell for your Slurm scripts; you'll see this on the first line of every example we share.  In a bash script, anything after the `#` is considered a comment and is not interpretted when the script is run.  In the case of Slurm scripts though, the Slurm scheduler is specifically looking for lines that start with `#SBATCH` and will interpret those as requests for your job.  Do NOT remove the `#` in front of the `SBATCH` command or your batch script will not work properly.  If you don't want Slurm to look at a particular `SBATCH` line in your script, put two `#` in front of the line.

The example Slurm script [BasicExample.sh](BasicExample.sh) provides a simple template for submitting a basic job in an HPC environment. It highlights key features such as cluster, partition, memory requirements, and more.

The [slurm-options.sh](slurm-options.sh) file in this directory provides a list of the most commonly used Slurm directives and a short explanation for each one.  It is not necessary to use all of these directives in every job script.  In the sample scripts throughout this repository, we list the required Slurm directives and a few others just as examples.  Know that the more specific you get when requesting resources on CCR's clusters, the fewer options the job scheduler has to place your job.  When possible, it's best to only specify what you need to and let the scheduler do it's job.  If you're unsure what resources your program will require, we recommend starting small and [monitoring the progress](https://docs.ccr.buffalo.edu/en/latest/hpc/jobs/#monitoring-jobs) of the job, then you can scale up.  

## Placeholders

Portions of the example batch scripts which must be changed for the script to function are referred to as placeholders and denoted by square brackets. Replace the following placeholders in your 
script with details specific to your use case before submitting your job.

- `[cluster]`: ub-hpc, faculty
- `[partition]`: general-compute, debug, industry, scavenger, ub-laser, [other available options](https://docs.ccr.buffalo.edu/en/latest/hpc/clusters/#ub-hpc-compute-cluster)
- `[qos]`: usually the same as `[partition]` - refer to [CCR docs](https://docs.ccr.buffalo.edu/en/latest/hpc/jobs/#slurm-directives-partitions-qos)
- `[SlurmAccountName]`: Tell Slurm which account to run this job under. If not specified, your default account will be used. Use the `slimits` command to see what accounts you have access to.

## Table of Topics

| Topic                                                                                                   | Description |
|---------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------- 
| [Get Started](#get-started)                                                                             | Somewhere to get started |
| [Basic Example](./BasicExample.sh)                                                                      | A simple template for submitting a basic job in an HPC environment |
| [Commonly used Slurm directives](./slurm-options.sh)                                                    | A comprehensive Slurm script with commonly used directives |
| [Advanced scripts](./1_Advanced)                                                                        | A directory containing batch scripts for more advanced use cases, including job arrays, parallel computing, and utilizing the scavenger partition (Coming Soon) |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Job Arrays](./1_Advanced/JobArrays)                                      | Coming Soon |
| [Application Specific scripts](./2_ApplicationSpecific)                                                 | A directory containing batch scripts for a range of applications with specific setup requirements. You will not find an example script for every piece of software installed on CCR's systems |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[AlphaFold](./2_ApplicationSpecific/alphafold)                            | AlphaFold example |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[HuggingFace](./2_ApplicationSpecific/huggingface)                        | HuggingFace example |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[LSDYNA](./2_ApplicationSpecific/lsdyna)                                  | LSDYNA example |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[MATLAB](./2_ApplicationSpecific/matlab)                                  | The MATLAB directory includes example scripts for running serial, multithreaded, and GPU MATLAB jobs |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[MATLAB/Serial](./2_ApplicationSpecific/matlab/serial)        | Example Serial MATLAB job |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[MATLAB/Multithreaded](./2_ApplicationSpecific/matlab/multithreaded)| Example Multithreaded job for parallel computing |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[MATLAB/GPU](./2_ApplicationSpecific/matlab/GPU)              | MATLAB script that performs a matrix decomposition using a GPU |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[NiftyPet](./2_ApplicationSpecific/niftypet)                              | Slurm job example for running a NiftyPET Jupyter notebook demo |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[PetSC-Custom_Compile](./2_ApplicationSpecific/petsc-custom-compile)      | Example of building PETSc with EasyBuild via a Slurm job |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Python](./2_ApplicationSpecific/python)                                  | A directory containing examples of serial Python job, with multithreaded and GPU examples coming soon |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Python/Serial](./2_ApplicationSpecific/python/serial)        | Serial Python program along with the corresponding Slurm script, which can be customized to run a serial Python job |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Sentence-Transformers](./2_ApplicationSpecific/sentence-transformers)    | Example Sentence-Transformers job |
