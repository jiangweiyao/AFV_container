# Demonstrating how to replicate Python 3 environments using pip, Conda, and containers.

This repository shows how to export Python 3 environment using 3 popular methods:
1. Exporting the list of installed Python 3 libraries using `pip freeze` and installing them using `pip install -r requirements.txt`
2. Exporting the environmental dependencies using `conda export` and `conda env create -f environment.yml`
3. Building a container to contain all the dependencies from the Conda environment file. 


## Download the repository
You can download the repository using a standard git command to get started.
```
git clone https://github.com/jiangweiyao/AFV_container.git
```

## Install all the libraries using Pip
Assuming you have Python 3 installed, and you want to install all the required libraries to that Python 3, you can run the following command to tell Python 3 to automatically install all the libraries listed in the requirement.txt in the git repository.
```
pip install -r requirements.txt
```
You can start the included jupyter-lab by running
```
jupyter-lab
```
You can use the following command to generate a list all the libraries installed in your Python 3. You can redirect the output to requirements.txt and rebuild it on another computer as above.
```
pip freeze
```

## Build the Conda Environment 
A Conda environment can be replicated from the included environment.yml file to include all the dependencies (including Python 3 itself). Run the following command to create the environment:
```
conda env create -f environment.yml
```
You can start the included jupyter-lab by running
```
conda activate AFV
jupyter-lab
```
You can deactivate your environment after use with
```
conda deactivate
```
You can use the following command to generate a manifest of all Conda packages. You can redirect to environment.yml and rebuild your Conda environment else where.
```
conda env export --no-build
```

## Build and Run as a container
A Dockerfile for building the environment in a docker image via Conda is included in the repository. It pulls the Miniconda3 image, building the Conda environment in the image from environment.yml, and then permanently activate the environment. You can also set docker hub to auto build the image by looking at this repository (how this docker image is built).

https://hub.docker.com/r/jiangweiyao/afv_demo

You can automatically pull the image and run jupyter-lab via Singularity using the following command. This is the recommended way to interact with the image because Singularity does not require root level access.
```
singularity exec docker://jiangweiyao/afv_demo jupyter-lab
```

You can also use docker to auto-pull the image and run it with the following command. This is not recommended as Docker runs as root, causing various access issues.
```
docker run -it --rm -p 8888:8888 jiangweiyao/afv_demo jupyter-lab --allow-root --ip=0.0.0.0
```
