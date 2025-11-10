# Contribution Guidelines

If you have an example you think would benefit users of the CCR community, you can create a fork of this repository and submit a pull request for CCR staff to review. If you do so, please try to align your submission with existing examples using the following guidelines:

- Keep examples organized in respective per example directories.
- Do not include large data sets. Scripts should use `$ENV` variables to specify path to data/supplemental files.
- Use [placeholders](slurm/README.md) in example scripts when possible.
- Use `$SLURM` variables to specify Slurm specific information (e.g., `$SLURM_JOB_ID`, `$SLURM_NPROCS`, `$SLURM_NODEFILE`, `$SLURMTMPDIR`, `$SLURM_SUBMIT_DIR`, etc).
- Include explanatory comments in your files using the same format as similar examples.
