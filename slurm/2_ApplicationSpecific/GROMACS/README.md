# GROMACS

 GROMACS is an open-source software suite for high-performance molecular dynamics and output analysis.

## Example Scripts

Provided in this repository are several example GROMACS Slurm jobs.
GROMACS can make use of CPUs and (for certain tasks) GPUs.  The GPU versioh
of GROMACS supports both CPU only and CPU/GPU use cases, so all the examples
use a GPU version of GROMACS.

All these examples use the GROMACS benchmarks

Note that the water-cut1.0_GMX50_bare/0000.65 fails - I believe the test needs
to be larger to run on the allocated resources.

### One node CPU
[slurm_GROMACS_benchmark_one_node_CPU.bash](./slurm_GROMACS_benchmark_one_node_CPU.bash)

### Two nodes, CPU
[slurm_GROMACS_benchmark_two_nodes_CPU.bash](./slurm_GROMACS_benchmark_two_nodes_CPU.bash)

### One node, One GPU
[slurm_GROMACS_benchmark_one_node_one_GPU.bash](./slurm_GROMACS_benchmark_one_node_one_GPU.bash)

### One node, Two GPUs
[slurm_GROMACS_benchmark_one_node_two_GPUs.bash](./slurm_GROMACS_benchmark_one_node_two_GPUs.bash)

