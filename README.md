# mc-tooling-dsmlops
Tooling MC for DS or MLOPS

For this demo, we used Miniconda, so you need to have it installed before reading the notebook. After installing there are the steps :
1. launch the Miniconda Prompt.
2. Create, liste and activate the `masterclass_env`.
3. Install `juputer lab` (See the instructions in the notebook `intro_conda_jupyterNB_EN.ipynb`)
4. Run `jupyter lab`

## Ressources :
* [conda cheat sheet](https://docs.conda.io/projects/conda/en/4.6.0/_downloads/52a95608c49671267e40c689e0bc00ca/conda-cheatsheet.pdf)

## activate black theme :

To activate the black theme in Jupyter Lab, you can follow these steps:

1. Install the `jupyterthemes` package by running the following command in your terminal:
```
pip install jupyterthemes
```

2. Once installed, you can view the list of available themes by running the following command in your terminal:
```
jt -l
```

3. To activate the black theme, run the following command in your terminal:
```
jt -t JupyterLab Dark
```

4. Finally, reload the Jupyter Lab page to see the changes.

Alternatively, you can also change the theme from the JupyterLab settings menu. Navigate to `Settings > JupyterLab Theme > JupyterLab Dark` to activate the black theme.

## working with jupyter in Docker

To install packages using pip from within the running container, you can follow these steps:

1. Start the container: If you haven't already started the container, you can do so by running `docker-compose up` from the directory where your docker-compose.yml is located.

2. Access the container's shell: Once the container is up and running, you can access its shell by executing an interactive bash session. Find the name of the running container using docker ps and then use docker exec to start a shell session:

```bash
docker exec -it <container_name> /bin/bash
```
Replace <container_name> with the actual name of your container.

3. Install packages with pip: Now that you are inside the container, you can use pip to install any package you need. For example:

```bash
pip install requests beautifulsoup4
```

This command would install the requests and beautifulsoup4 packages inside the container.

4. Exit the container: After you've finished installing packages, you can exit the container by typing exit or pressing Ctrl+D.

Alternatively, if you want to automate the package installation process so that it occurs every time you start the container, you can modify the docker-compose.yml file to include the pip install command:

```yml
version: '3'

services:
  jupyter:
    image: continuumio/miniconda3
    ports:
      - "8888:8888"
    volumes:
      - ./notebooks:/opt/notebooks
    command: >
      /bin/bash -c "conda install -c conda-forge notebook jupyterlab -y &&
                    pip install requests beautifulsoup4 &&
                    jupyter lab --notebook-dir=/opt/notebooks --ip='0.0.0.0' --port=8888 --no-browser --allow-root"
```

In this example, requests and beautifulsoup4 are the packages that will be installed with pip when the container starts. You can replace these with any other packages you need.

After updating the docker-compose.yml file, make sure to rebuild your Docker container if necessary, and then start or restart it to apply the changes.