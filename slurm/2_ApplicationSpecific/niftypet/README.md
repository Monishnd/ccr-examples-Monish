# Example NiftyPET job

This runs the full NiftyPET juptyer notebook demo in a slurm job.

## Placeholders:

Portions of this example batch script contain placeholders, denoted by square brackets. Refer to the /slurm [README](../../README.md) for details and options.

## How to use

1. Download raw data files to your working directory:

```
$ mkdir niftypet-demo
$ cd niftypet-demo
$ wget -O amyloidPET_FBP_TP0_extra.zip 'https://zenodo.org/records/1472951/files/amyloidPET_FBP_TP0.zip?download=1'
```

2. Unzip data:

```
$ unzip amyloidPET_FBP_TP0_extra.zip
```

3. Submit slurm job:

```
$ sbatch niftypet-demo-slurm.sh
```

4. Results will be saved to a new notebook: demo.nbconvert.ipynb

Copy the demo.nbconvert.ipynb file to your local machine and view it here:

https://jsvine.github.io/nbpreview/
