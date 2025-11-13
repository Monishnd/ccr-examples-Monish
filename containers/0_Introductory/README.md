# Introductory Python Container
If you'd like to utilize a newer version of Python than what is installed in CCR's software repository or your workflow requires the use of GPUs, utilizing Python in a container environment is the ideal choice.

This example demonstrates how to download a Python Docker container, convert it to an Apptainer file, and run a simple script to extract the Python version.

Please refer to our [container documentation](https://docs.ccr.buffalo.edu/en/latest/howto/containerization/) for more information on using containers.

## Using a Python Docker image with Apptainer
1. Start an interactive job

Interactive jobs are used to pull containers because Apptainer is not available on the CCR login nodes and compile nodes may not provide enough resources for your container to build.

Refer to the CCR documentation for more information on [running interactive jobs](https://docs.ccr.buffalo.edu/en/latest/hpc/jobs/#interactive-job-submission) and [pulling containers](https://docs.ccr.buffalo.edu/en/latest/howto/containerization/#pulling-images).
See CCR docs for more info on [running jobs](https://docs.ccr.buffalo.edu/en/latest/hpc/jobs/#interactive-job-submission)

`salloc --cluster=[cluster] --partition=[partition] --qos=[qos] --mem=32GB --time=01:00:00 --no-shell`

Sample output:
```
salloc: Pending job allocation [JobID]
salloc: job [JobID] queued and waiting for resources
salloc: job [JobID] has been allocated resources
salloc: Granted job allocation [JobID]
salloc: Waiting for resource configuration
salloc: Nodes cpn-d01-06 are ready for job
```


Once the requested node is available, use the `srun` command to login to the compute node:
`srun --jobid=[JobID] --export=HOME,TERM,SHELL --pty /bin/bash --login`

sample output:
You should now be on the compute node allocated to you, so the command prompt should look like: `CCRRusername@cpn-d01-06:~$`

2. Navigate to your build directory & set a temp directory for cache

In this example we're using our project directory for our build directory, where we must make a cache subdirectory and export the `APPTAINER_CACHEDIR` environment variable with the following commands:
```
cd /projects/academic/[YourGroupName]/[CCRUsername]  
mkdir cache  
export APPTAINER_CACHEDIR=/projects/academic/[YourGroupName]/[CCRUsername]/cache
```
   
4. Pull the specified Docker Python Image
   
Use the `apptainer pull` command, specifying the target container file to be `python.sif`. `docker://python:3` is where the specified Python image is stored.

```
apptainer pull python.sif docker://python:3
```

5. Run script in container

In this example, we are using [`print_version.py`](./print_version.py), a Python script that simply prints the version of Python. Ensure you've copied the `print_version.py` file to your build directory. 

Run the following command:
`apptainer exec python.sif python print_version.py`

Your output will look similar to `3.14.0 (main, Oct 21 2025, 11:44:31) [GCC 14.2.0]`
`3.14.0 (main, Oct 21 2025, 11:44:31) [GCC 14.2.0]`

6. Cancel the job

Once you're done with the node, exit the compute node using the command `exit`. The output should simply show:
`logout`

Then, release your job's allocated resources using `scancel [JobID]`. There should be no output. The `squeue --me` command can be used to view your currently running jobs. 

**Note**: If you don't cancel the job, Slurm will release the allocated resources when the time requested for the job expires and you'll be automatically logged out of the compute node.
