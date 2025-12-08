#!/bin/bash -l

## This file is intended to serve as a template to be downloaded and modified for your use case.
## For more information, refer to the following resources whenever referenced in the script-
## README- https://github.com/ubccr/ccr-examples/tree/main/slurm/README.md
## DOCUMENTATION- https://docs.ccr.buffalo.edu/en/latest/hpc/jobs

## Select a cluster, partition, qos and account that is appropriate for your use case
## Available options and more details are provided in CCR's documentation:
##   https://docs.ccr.buffalo.edu/en/latest/hpc/jobs/#slurm-directives-partitions-qos
#SBATCH --cluster="[cluster]"
#SBATCH --partition="[partition]"
#SBATCH --qos="[qos]"
#SBATCH --account="[SlurmAccountName]"

## two nodes, 32 cores (16 cores per node)
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=16
#SBATCH --job-name=gmx-2n-CPU

## Infiniband networks supported with ccrsoft/2023.01
#SBATCH --constraint="[ICE-LAKE-IB|CASCADE-LAKE-IB]"

## Job runtime limit, the job will be canceled once this limit is reached. Format- dd-hh:mm:ss
#SBATCH --time=01:00:00

## Continue on error - continue if a single test fails
set +e

echo "SLURM_JOB_ID=${SLURM_JOB_ID}"
echo "SLURM_JOB_NODELIST=${SLURM_JOB_NODELIST}"
echo

## report any allocated GPUs
if which nvidia-smi > /dev/null 2>&1 && [ ! -z "${SLURM_JOB_GPUS}" ]
then
  echo "GPU info:"
  srun --ntasks-per-node=1 --nodes="${SLURM_JOB_NUM_NODES}"  bash -c 'printf "hostname: %s\n%s\n\n" "$(hostname -s)" "$(nvidia-smi -L)"'
else
  echo "No GPU allocated"
fi
echo

## Change the nvidia cache dir from ~/.nv/ComputeCache
export CUDA_CACHE_PATH="${SLURMTMPDIR:-/var/tmp}/nv_$(id -nu)"
mkdir -p "${CUDA_CACHE_PATH}"

## NOTE: GROMACS is only built in the ccrsoft/2023.01 software release
module load ccrsoft/2023.01
module load gcc/11.2.0 openmpi/4.1.1 gromacs/2023.1-CUDA-11.8.0
## load the newer UCX module
module load ucx/1.13.1

### Environment varibles for OpenMPI over Infiniband
export OMPI_MCA_pml=ucx && export OMPI_MCA_btl="self,vader,ofi"

### Environment varibles for PMIx (srun --mpi=pmix [...])
export PMIX_MCA_psec=native && export PMIX_MCA_gds=hash

## Fetch the tests
if [ ! -f "water_GMX50_bare.tar.gz" ]
then
  wget --no-verbose http://ftp.gromacs.org/pub/benchmarks/water_GMX50_bare.tar.gz
fi
gzip -dc water_GMX50_bare.tar.gz | tar xf -

## Run the tests
find $(pwd)/water* -name pme.mdp -exec dirname "{}" \; | while read dir
do
  cd "${dir}"
  echo "================================================================================"
  echo "dir: $(pwd)"
  echo "================================================================================"
  echo "running a single task: \"gmx grompp -f pme.mdp -o bench.tpr\""
  echo "---------------------------------------------"
  gmx grompp -f pme.mdp -o bench.tpr < /dev/null
  if [ -e "bench.tpr" ]
  then
    echo "-------------------------------------------------------------------------------------------------------------"
    echo "running parallel tasks:  \"gmx_mpi mdrun -resethway -npme 0 -notunepme -noconfout -nsteps 1000 -v -s bench.tpr\""
    echo "-------------------------------------------------------------------------------------------------------------"
    srun --mpi=pmix gmx_mpi mdrun -resethway -npme 0 -notunepme -noconfout -nsteps 1000 -v -s bench.tpr < /dev/null
  else
    echo "-------------------------" >&2
    echo "ERROR: gmx grompp failed" >&2
    echo "-------------------------" >&2
  fi
  echo
done

echo "================================================================================"
echo "All Done!"
echo "================================================================================"
