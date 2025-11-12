# Introductory Python Container
If you'd like to utilize a newer version of Python than what is installed in CCR's software repository or your workflow requires the use of GPUs, utilizing Python in a container environment is the ideal choice.

This example demonstrates how to download a Python Docker container, convert it to an Apptainer file, and run a simple script to extract the Python version.

Please refer to our [container documentation](https://docs.ccr.buffalo.edu/en/latest/howto/containerization/) for more information on using containers.

## Building the Container
1. Start an interactive job

**Note**: Apptainer is not available on the CCR login nodes and the compile nodes may not provide enough resources for you to build a container. We recommend requesting an interactive job on a compute node to conduct this build process.
See CCR docs for more info on [running jobs](https://docs.ccr.buffalo.edu/en/latest/hpc/jobs/#interactive-job-submission)

`
salloc --cluster=ub-hpc --partition=general-compute --qos=general-compute --mem=32GB --time=02:00:00 --no-shell
`

sample output:
```
salloc: Pending job allocation 22150445
salloc: job 22150445 queued and waiting for resources
salloc: job 22150445 has been allocated resources
salloc: Granted job allocation 22150445
salloc: Waiting for resource configuration
salloc: Nodes cpn-d01-06 are ready for job
```


Once the requested node is available, use the `srun` command to login to the compute node:
`
srun --jobid=22150445 --export=HOME,TERM,SHELL --pty /bin/bash --login
`

sample output:
`CCRusername@cpn-d01-06:~$ `

2. Navigate to your build directory & set a temp directory for cache

You should now be on the compute node allocated to you. In this example we're using our project directory for our build directory.
```
CCRusername@cpn-d01-06:~$ cd /projects/academic/[YourGroupName]/[CCRusername]  
CCRusername@cpn-d01-06:~$ mkdir cache  
CCRusername@cpn-d01-06:~$ export APPTAINER_CACHEDIR=/projects/academic/[YourGroupName]/[CCRusername]/cache
```
   
4. Pull the specified Docker Python Image
   
Use the `apptainer pull` command, specifying the target container file to be `python.sif`. `docker://python:3` is where the specified Python image is stored.

```
apptainer pull python.sif docker://python:3
```

5. Run script in container

In this example, we are using [`print_version.py`](./print_version.py), a Python script that simply prints the version of Python. Ensure you've copied the `print_version.py` file to your build directory.

```
CCRUsername@cpn-d01-06:/projects/academic/[YourGroupName]/[CCRusername]$ apptainer exec python.sif python print_version.py
3.14.0 (main, Oct 21 2025, 11:44:31) [GCC 14.2.0]
```

6. Cancel the job

Once you're done with the node, use the `exit` command and then release your job's allocated resources using the command `scancel $JOBID`.
`$JOBID` can be obtained by the command `squeue --me`, which lists your currently running jobs. 
If you don't cancel the job, Slurm will release the allocated resources when the time requested for the job expires and you'll be automatically logged out of the compute node.

```
exit
scancel 22150445
```