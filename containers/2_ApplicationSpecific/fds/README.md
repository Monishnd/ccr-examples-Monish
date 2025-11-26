# Example FDS container  

The Fire Dynamics Simulator (FDS) is a large-eddy simulation (LES) code for low-speed flows, with an emphasis on smoke and heat transport from fires.  For more information on this program, visit the [website](https://pages.nist.gov/fds-smv/).  The easiest way to run FDS in CCR's HPC environment is using a container. Docker containers are available via this [third party](https://hub.docker.com/r/satcomx00/fds) and version 6.7.9 was tested for this example.  This container includes Intel MPI Library 2021.6.  CCR's `ccrsoft/2023.01` [software environment](https://docs.ccr.buffalo.edu/en/latest/software/releases/#202301) includes a module for `intel/2022.00` which includes `impi 2021.5.0`  These two versions of MPI are alike enough that this container works when loading the `intel/2022.00` module.  However, the user should be aware with future versions of FDS and CCR's intel modules, that you must align MPI versions on the system with the container in order for them to work properly.  See [here](https://docs.ccr.buffalo.edu/en/latest/howto/containerization/#building-mpi-enabled-images) for more info.

## Pulling the container  

Please refer to CCR's [container documentation](https://docs.ccr.buffalo.edu/en/latest/howto/containerization/) for information on using Apptainer.  This example shows how to pull a container from Docker Hub and convert it to an Apptainer image file.  This can be done from a [compile node or a compute node](https://docs.ccr.buffalo.edu/en/latest/hpc/clusters/#node-types).  Apptainer is not available on the CCR login nodes.  

Request and log on to a compute node using the [interactive job submission](https://docs.ccr.buffalo.edu/en/latest/hpc/jobs/#interactive-job-submission) instructions.  Then, `cd` into your build directory and set a temporary directory for cache there. Instructions can be found [here](https://docs.ccr.buffalo.edu/en/latest/howto/containerization/#setting-up-temporary-storage-directories).

Refer to the Apptainer documentation for [pulling images](https://docs.ccr.buffalo.edu/en/latest/howto/containerization/#pulling-images). In this example, we are using the following container image from Docker Hub:

```
docker://satcomx00/fds:6.7.9
```

After the pull completes, the Apptainer image will be saved as `fds_6.7.9.sif` in your current working directory.  


## Running the container image  

You can run FDS either in an interactive job or non-interactively by using a batch script (recommended).  

### Interactive option  

On a login node, load the needed module: 

```
module load intel
```

then export the required library path:

```
export I_MPI_PMI_LIBRARY=/opt/software/slurm/lib64/libpmi.so
```

Navigate to your build directory. Ensure the [`radiator.fds`](radiator.fds) file is present. This input file is taken from the FDS website and will be used for the example. 

Request a compute node with `salloc`. Once the compute node is ready, use `srun` to run FDS on the allocated node:

```
srun --jobid=[JobID] mpirun -np 3 apptainer exec fds_6.7.9.sif fds radiator.fds  
```

Sample output:

```
Starting FDS ...

 MPI Process      0 started on [NodeID].core.ccr.buffalo.edu
 MPI Process      1 started on [NodeID].core.ccr.buffalo.edu
 MPI Process      2 started on [NodeID].core.ccr.buffalo.edu

 Reading FDS input file ...


 Fire Dynamics Simulator

 Current Date     : October 15, 2025  17:47:32
 Revision         : FDS6.7.9-0-gec52dee42-release
 Revision Date    : Sun Jun 26 14:36:40 2022 -0400
 Compiler         : ifort version 2021.6.0
 Compilation Date : Jun 28, 2022 23:02:23

 MPI Enabled;    Number of MPI Processes:       3
 OpenMP Disabled

 MPI version: 3.1
 MPI library version: Intel(R) MPI Library 2021.6 for Linux* OS


 Job TITLE        : radiator
 Job ID string    : radiator

 Time Step:      1, Simulation Time:      0.07 s
...
...
 Time Step:  10331, Simulation Time:    600.00 s

STOP: FDS completed successfully (CHID: radiator)
```

### Batch script option  

Using the [`fds-example.bash`](fds-example.bash) script as an example, modify the settings to meet your needs.  FDS is capable of running across multiple nodes but this should only be utilized if your problem requires more than the number of CPUs in a compute node.  Running FDS across multiple nodes will increase the time it takes for your problem to compute.  The specifications for available compute nodes in CCR's UB-HPC cluster can be found [here](https://docs.ccr.buffalo.edu/en/latest/hpc/clusters/#ub-hpc-detailed-hardware-specifications).  Please refer to the Slurm options file and examples for running batch scripts as shown in our [Slurm examples repository](../../../slurm/README.md) for more details.  Please also refer to the [FDS documentation](https://pages.nist.gov/fds-smv/manuals.html) to properly setup your requests for CPUs and tasks.

## Additional Information

- The [Placeholders](../README.md#placeholders) section lists the available options for each placeholder used in the example scripts.
- For more info on accessing shared project and global scratch directories, resource options, and other important container topics, please refer to the CCR [container documentation](https://docs.ccr.buffalo.edu/en/latest/howto/containerization/) 
