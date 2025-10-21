# Introductory Python Container
If you'd like to utilize a newer version of Python than what is installed in CCR's software repository or your workflow requires the use of GPUs, utilizing Python in a container environment is the ideal choice.

This tutorial demonstrates how to download a Python Docker container, convert it to an Apptainer file, and run a simple script to extract the Python version.

Note: Apptainer is only available on compute and compile nodes. Please refer to our [container documentation](https://docs.ccr.buffalo.edu/en/latest/howto/containerization/) for more information on using containers.

## Using a specified version of Python with Apptainer
1. Start an interactive job

Apptainer is not available on the CCR login nodes and the compile nodes may not provide enough resources for you to build a container. We recommend requesting an interactive job on a compute node to conduct this build process. This will allow you to test your build after completion as well. Please refer to our documentation on [running jobs](https://docs.ccr.buffalo.edu/en/latest/hpc/jobs/#interactive-job-submission) for more information. This is provide as an example only and not all users will have access to the resources in this example:
```
$ salloc --cluster=ub-hpc --partition=general-compute --qos=general-compute --mem=32GB --time=02:00:00
salloc: Pending job allocation 19319338
salloc: job 19319338 queued and waiting for resources
salloc: job 19319338 has been allocated resources
salloc: Granted job allocation 19319338
salloc: Nodes cpn-h23-04 are ready for job
CCRusername@cpn-h23-04:~$
```

2. Navigate to your build directory & set a temp directory for cache
   
You should now be on the compute node allocated to you. In this example we're using our project directory for our build directory. Ensure you've placed your python.sif and print_version.py file in your build directory
```
CCRusername@cpn-h23-04:~$ cd /projects/academic/[YourGroupName]/[CCRusername]  
CCRusername@cpn-h23-04:~$ mkdir cache  
CCRusername@cpn-h23-04:~$ export APPTAINER_CACHEDIR=/projects/academic/[YourGroupName]/[CCRusername]/cache
```
   
4. Pull the specified Docker Python Image
   
Use the `apptainer pull` command, specifying the target container file to be `python.sif`. `docker://python:3` is where the specified Python image is stored.
```
apptainer pull python.sif docker://python:3
```

5. Run script in container

``print_version.py`` script:
```
import sys

print(sys.version)
```
In this example, we are using `print_version.py`, a Python script that simply prints the version of Python.

```
apptainer exec python.sif python print_version.py
```