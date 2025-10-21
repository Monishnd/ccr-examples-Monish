# Example script for job arrays

 This directory includes an [example](./example.sh) script that shows how to run a Job Array on CCR's clusters.

## How to use
Job arrays are groups of nearly identical jobs submited with 1 SLURM script. These jobs must have the same initial options (as specified in the script), but can be changed using some commands.

The SLURM option `--array` sets a job array with specified index values to be submitted. The formatting for this is as follows:
- `--array=0-4` which submits a job array between index values 0 and 4.
- `--array=1,3,5,7` which submits a job array with the index values of 1, 3, 5, and 7.

The provided [script](./example.sh) is a minimal SLURM example that outputs files based on a Job Array. Be sure to modify parts of the script to suit your specific needs. For more details, refer to [our documentation](https://docs.ccr.buffalo.edu/en/latest/hpc/jobs/#job-arrays) or to the [SLURM documentation](https://slurm.schedmd.com/job_array.html).

