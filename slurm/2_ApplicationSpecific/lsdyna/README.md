# Example lsdyna job

Provided are two example lsdyna slurm jobs: [lsdyna.sh](./lsdyna.sh) a script for non-parallel processing, and [lsdyna_mpp.sh](./lsdyna_mpp.sh) a script for massively parallel processing.

LS-DYNA is now part of the Ansys software bundle. To load the module, use `module load ansys/2023R1` The lsdyna executables do not show up in the path any longer. To use them properly, you'll 
need to use these commands:

- Single Precision: `$EBROOTANSYS/v231/ansys/bin/linx64/lsdyna_sp.e ncpus=$SLURM_NPROCS i=ball_and_plate.k` (CCR Staff: I've added commands from the scripts. Need to be confirmed)
- Single precision, massively parallel: `$EBROOTANSYS/v231/ansys/bin/linx64/lsdyna_sp_mpp.e i=ball_and_plate.k`
- Double Precision: `$EBROOTANSYS/v231/ansys/bin/linx64/lsdyna_dp.e ncpus=$SLURM_NPROCS i=ball_and_plate.k`
- Double precision, massively parallel: `mpiexec $EBROOTANSYS/v231/ansys/bin/linx64/lsdyna_dp_mpp.e i=ball_and_plate.k`

Please refer to the Ansys LS-DYNA [manuals](https://lsdyna.ansys.com/manuals/) for further information and options.

## Placeholders:

Portions of this example batch script contain placeholders, denoted by square brackets. Refer to the /slurm [README](../../README.md) for details and options.
