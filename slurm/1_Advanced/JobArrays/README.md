# Example Script for Slurm Job Arrays

This directory includes an [example script](./example.bash) that shows how to run a Job Array on CCR's clusters. Be sure to modify parts of the script to suit your specific needs.

## What Are Job Arrays
Job Arrays let you submit multiple similar jobs using a single Slurm batch script. Each job in the array shares the same requested resources specified in your batch script.

## Specifying Arrays
The resource flag `--array` sets a job array with specified index values to be submitted. The formatting for this is as follows:  
```
#SBATCH --array=0-4      #  Submits a job array between index values 0 and 4.  
#SBATCH --array=1,3,5,7  #  Submits a job array with the index values of 1, 3, 5, and 7.
```
## Output File Naming
Use these format symbols in your output file names:
- `%A` is the job array master job ID
- `%a` is the individual job index number  
```
SBATCH --output="slurm-%A_%a.out"  #  Generates files with names "slurm-masterID_indexNumber"
```

## Example:
```
##  Specify what jobs in the array will run
#SBATCH --array=0-3

##  Output files format
#SBATCH --output="slurm-%A_%a.out"
```

If this job array was run as job 12345678 this formatting would generate the output files:
- `"slurm-12345678_0.out"`
- `"slurm-12345678_1.out"`
- `"slurm-12345678_2.out"`
- `"slurm-12345678_3.out"`

  ## Learn More
- [Our Documentation](https://docs.ccr.buffalo.edu/en/latest/hpc/jobs/#job-arrays)
- [Slurm Documentation](https://slurm.schedmd.com/job_array.html)
