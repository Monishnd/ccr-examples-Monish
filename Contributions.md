# Adding Contributions

If you have an example you think would benefit users of the CCR community, you can follow these steps to create a fork of this repository and submit a pull request for CCR staff to review:

1. [Fork this repo](https://github.com/ubccr/ccr-examples/fork)

2. Clone your fork and enter it's directory:

    ```bash
    git clone https://github.com/[YourUser]/ccr-examples.git
    cd ccr-examples
    ```

3. Start adding to or updating the repository!

4. Submit a [pull request](https://github.com/ubccr/ccr-examples/pulls)

## Standards and Guidelines

Keep examples organized in respective per example directories following the established [directory structure](README.md#navigating-the-repository) and remember to apply any necessary changes to existing files (e.g., table of contents). Please do your best to align the format of your submission with the following standards:

### README Files

- Include a markdown `README.md` file with clear and concise instructions on how to modify and reproduce the example.
- Separate your `README` into sections and clearly ennumerate steps required to reproduce the example.
- Avoid repitition by providing links to information already detailed in the [CCR documentation](https://docs.ccr.buffalo.edu/en/latest/) or other `README` files in this repository.
- Do not include command prompts (e.g., `$`, `>`) inside code blocks for ease of copying code. Instead, indicate what the prompt should look like in the preceeding text.
- Separate command outputs into their own code blocks with preceeding statements that the user should see a *similar* result.
- Stylize any commands outside of code blocks using code snippets.
- Feel free to specify the syntax of your code blocks to enhance readability.
- Use notes (note, warning, danger, important) to emphasize important points of your `README`. [See here for markdown syntax](https://python-markdown.github.io/extensions/admonition/).

### Additional Files

- Include as few files as possible to avoid clutter, but be sure everything needed to reproduce the example is provided.
- Do not include large data sets, instead use `$ENV` variables to specify the path to data/supplemental files. Co-ordinate with CCR Staff to ensure data is placed in a location that is accessible to all users.
- File names should be descriptive and concise with appropriate extensions, using a dash `-` to separate words if necessary.
- Provide brief comments in separate lines preceeding the associated code.
- Comment lines in `.bash` files should begin with `##   ` to clearly differentiate comments and Slurm constraints.

### Use of Variables

- Use the defined [placeholders](slurm/README.md#placeholders) instead of their associated case specific values.
- Use `$SLURM` variables to specify Slurm specific information (e.g., `$SLURM_JOB_ID`, `$SLURM_NPROCS`, `$SLURM_NODEFILE`, `$SLURMTMPDIR`, `$SLURM_SUBMIT_DIR`).
- Use Unix `$ENV` variables wherever possible (e.g., `$PATH`, `$TEMP`, `$HOME`), including those specific to EasyBuild (e.g., `$EBROOT`).
- Avoid using regular expressions unless required, and briefly comment on their function if necessary.

## Reference Materials

- For a nice overview of markdown syntax [see here](https://www.markdownguide.org/basic-syntax)
