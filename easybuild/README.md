# EasyBuild Examples

CCR staff utilize the Easybuild framework when installing software and this tool is made available to CCR users to install software themselves. Easybuild ensures that the compilation and linking that happens during a software installation is done correctly and will work with our systems. CCR staff do not offer courses on using Easybuild, nor are we able to troubleshoot issues you might run into. However, there is excellent [documentation](https://docs.easybuild.io/) and [tutorials](https://tutorial.easybuild.io/) provided by Easybuild developers.

This directory includes examples for building and rebuilding software with EasyBuild on CCR's clusters. For background information on EB recipes, toolchains, and related concepts, refer to our [EasyBuild documentation](https://docs.ccr.buffalo.edu/en/latest/howto/easybuild/#what-is-a-recipe). For common questions and troubleshooting tips, check out our EasyBuild FAQ [here](https://docs.ccr.buffalo.edu/en/latest/howto/easybuild/#frequently-asked-questions).

## When to use or not use EasyBuild to install software in your account

There are a few use cases in which you may want to use EasyBuild to install software in your own space (project space preferred over home directories):

1. If you need a custom or modified build
2. If you need to install a nightly build, or a version of a software which does not have a release number
3. If there isn't an existing EB recipe and you want to create your own
4. If we at CCR are not allowed to install the package centrally for licensing reasons, such as some commercial software packages (Gaussian, Orca, VASP and Materials Studio in particular)

On the contrary, you should not install software packages in your own space for the following reasons:

1. If you need a different release version (CCR Staff: Not completely sure about this)
2. If you need a software package built using a different compiler, MPI or CUDA implementation

Users can request software be installed by CCR staff by submitting a new issue in our software-layer GitHub respository. More information can be found [here](https://docs.ccr.buffalo.edu/en/latest/software/building/#software-build-requests)

When in doubt, please ask [CCR Help](https://docs.ccr.buffalo.edu/en/latest/help/) for advice.

## Elementary Example ([0_Introductory](./0_Introductory))

This directory contains an elementary example for users to get started on building/rebuilding their own software.

## Advanced Topics ([1_Advanced](./1_Advanced))

Coming Soon

## Application Specific ([2_ApplicationSpecific](2_ApplicationSpecifc))

This directory contains examples used to build specific applications like Orca, Gaussian, etc. with EasyBuild. A [table](./2_ApplicationSpecific/README.md#table-of-topics) of available examples is provided for easier navigation and reference.
