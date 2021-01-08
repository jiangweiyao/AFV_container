FROM continuumio/miniconda3

# Install the conda environment
COPY environment.yml /
RUN conda env create -f /environment.yml && conda clean -a

# Add conda installation dir to PATH (instead of doing 'conda activate')
ENV PATH /opt/conda/envs/AFV/bin:$PATH

# Make RUN commands use the new environment:
SHELL ["conda", "run", "-n", "AFV", "/bin/bash", "-c"]

RUN echo "Make sure libraries are installed:"
RUN python -c "import fiona"
RUN python -c "import tabula"
RUN python -c "import pyarrow"


# Dump the details of the installed packages to a file for posterity
RUN conda env export --name AFV > AFV.yml


