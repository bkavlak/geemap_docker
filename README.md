# geemap_docker

This is an Ubuntu Image that includes the geemap package and more that are used in GIS applications. You can find the full package list below:

```
jupyter
jupyterlab
numpy
scipy
Pillow
matplotlib
opencv-contrib-python
scikit-image
scikit-learn
sentinelhub
sentinelsat
folium
fiona
shapely
geopandas
rasterio
tifffile
geemap
```
## Tutorial

I highly recommend this tutorial that explains almost everything you need and even more:

[KodeKloud FreeCodeCamp Docker Beginner Tutorial](https://www.youtube.com/watch?v=fqMOX6JJhGo&t=4516s)

## Requirements

* You need successfully install Docker and run a container as the tutorial explains.
* If you operate on Windows, you need to enable Hyper-V since this is an Ubuntu container. Check here: [Ubuntu Container on Windows](https://ubuntu.com/tutorials/tutorial-windows-ubuntu-hyperv-containers#1-overview)


## Installation

Pull the image:

```docker pull bkavlak/geemap:latest```

And, see you have it in your local machine:

```docker image ls```

## Process

Run the container by typing on bash or PowerShell:

```
docker run -it --name 'CONTAINER NAME' -p 8888:8888 -p 6006:6006 -v 'VOLUME DIRECTORY':/geemap/data bkavlak/geemap:latest bash
```

You should change text inside '___' as your preference (Don't include apostrophes ' ')

I highly recommend you add a volume to the container where you can transfer files between the computer and the container. (```VOLUME DIRECTORY``` = where you put your files on the local machine) Without a volume, you'll lose the files after you stop the container. The volume helps you to create a bridge so that you can use any data on the ```VOLUME DIRECTORY```.

After running the image you'll see a command as below:

```root@00dda2cb5ece:/geemap#```

This means that you are in the container.

To start a Jupyter Notebook:

```jupyter notebook --ip=0.0.0.0 --port=8888 --allow-root```

If successful, you will see some links below.

```
http://127.0.0.1:888/?token......
```

Copy the last link to a browser (like Chrome). Hit ENTER.

See that you have a file ```data```, which is the bridge between the container and local machine. You can move your data or files that you work on to the ```VOLUME DIRECTORY``` and see them on ```data``` in ```Jupyter```.

## Finish

After you are done with the analyses, you can click  ```COMMAND + C``` on bash to stop ```Jupyter``` and  ``` COMMAND + D``` to stop the container.

You can see the status of the container as:
```
docker ps -a
```

I recommend you remove the exited container:

```
docker rm -f 'CONTAINER ID'
```


