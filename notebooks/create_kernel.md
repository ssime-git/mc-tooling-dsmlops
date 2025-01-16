# create a kernel from scratch
---
Use the commands below :

```sh
# list envs
conda env list

# create one
conda create --name env_name python=3.8

# to activate environement
conda activate env_name

# install ipykernel
conda install -c anaconda ipykernel

# création de kernel (from within an environnement) Think about activate the environnement
python -m ipykernel install --user --name env_name
```