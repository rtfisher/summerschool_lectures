# ICESUN Kunming Lectures on Hydrodynamics and Ideal Magnetohydrodynamics for Stellar Transients, 2024

This page contains background reading, source code files, and notes for Prof. Fisher's [ICESUN Kunming Summer School](https://stellar-explosion2024.casconf.cn/) Lectures.

## Before the summer school:

1. Read the background reading.
- [Background Reading: "The Fundamental Equations of Hydrodynamics and Ideal Magnetohydrodynamics for Astrophysical Flows"](./hydro_equation_derivation.pdf)

2. Download and install the FLASH-X open source hydrodynamics code framework using Docker. The docker container also installs the Python-based toolkit yt for analysis of the data output by FLASH-X. Make sure you have downloaded and installed Docker; the Docker Desktop is recommended for first time users (https://www.docker.com/products/docker-desktop/).

- Save the Docker file as "flashx_dockerfile":
  - [Download flashx_dockerfile](https://raw.githubusercontent.com/rtfisher/summerschool_lectures/main/flashx_dockerfile)

Be sure that the full path of the directory to which you downloaded the file contains no spaces, as this may cause the following process to fail.
- Launch the Docker Desktop client. From the same directory where you have downloaded the Docker file, build the container and the code:
  <br>
  ```
  docker build -t flashx-app --progress=plain -f flashx_dockerfile .
  ```
- OR to build from scratch, one can _optionally_ use the --no-cache flag:
  <br>
  ```
  docker build --no-cache -t flashx-app --progress=plain -f flashx_dockerfile .
  ```
- The container automatically builds the Sedov test problem for FLASH-X by default. The build process will take several minutes, depending on your internet connection and processor speed. Once the build is successful, you will see the string "SUCCESS" after the link line.
  
3. To test run the Sedov problem in FLASH-X in a container named "flashx-container", and also mounting the "desktop" subdirectory within the container to a local directory named "flashx". On OS/X or Linux this can be included in your home directory:
 ```  
 docker run --rm -it --name flashx-container --hostname buildkitsandbox -v ~/flashx:/home/flashuser/flashx/Flash-X/desktop flashx-app
```
The "--rm" flag deletes the container after it has completed execution.

On Windows you must use a different command following Windows sytnax:
```
docker run --rm -it --name flashx-container --hostname buildkitsandbox -v C:\Users\YourUserName\flashx:/home/flashuser/flashx/Flash-X/desktop flashx-app
```
Be sure to change "YourUserName" to your actual user name on your computer.

- Once in the shell, run:
  ```
   ./flashx
  ```
- A successful run will output information for each timestep, terminating in "exiting: reached max SimTime". 

## Notes on Using Docker:

0. You may see an error message 'error getting credentials - err: exec: "docker-credential-desktop": executable file not found in $PATH, out: `" '. To fix this, simply edit the line storing your Docker credential preference in ~/.docker/config.json, changing "credsStore" to "credStore":

```
    "credStore": "desktop",
```

Note that this change must be made _every_ time the Docker client restarts and overwrites the previous configuration file. Save the config file and restart Docker. This appears to have been a bug in some older versions of Docker which has been fixed in more recent versions. It may arise on legacy systems (such as Intel architectures on older OS/X machines).


1. To copy files from Docker to your system, it is easiest to simply copy files over from within the container using a mounted subdirectory, as given for example in the run command above. Alternatively you can use the "docker cp" command from the system. For example, to copy the contents of a folder called "figures" within the Flash-X object directory to your desktop on OS/X, run the following from the command line on your system (not from within the Docker container): 
```
docker cp flashx-container:/home/flashuser/flashx/Flash-X/object/figures ~/Desktop/
```
Note the docker cp command does not accept wildcards ("*"), so it is better to organize the files you wish to copy over in directories.

2. To stop any running Docker containers, and to completely clean up the disk space used by Docker, on OS/X you can use this one-line command:

```sh
docker ps -q | xargs -r docker stop && \
docker ps -aq | xargs -r docker rm && \
docker images -q | xargs -r docker rmi -f && \
docker volume ls -q | xargs -r docker volume rm && \
docker builder prune -a -f && \
docker system prune -a -f
```
Note that this command will erase _all_ Docker workspace, including any other Docker containers you have on your machine, and should _only_ be used if you do not need any prior Docker containers.

3. Occasionally, you may need to restart the Docker daemon. On OS/X:
```
osascript -e 'quit app "Docker"'
open /Applications/Docker.app
```

## Notes on using yt

1. To produce a series of slice plots (say, of the density field), one can use a Python3 script calling yt:

```
import yt
import glob
for file in glob.glob ("sedov_hdf5_chk*"):
  ds = yt.load (file)
  yt.SlicePlot (ds, 'z', 'density').save()
```

2. It is also possible to produce 1D line plots using yt. The following example plots density from x = 0.5 (the center of the Sedov explosion in this setup) to x = 1 (the right edge of the domain):
```
import yt
import glob
for file in glob.glob ("sedov_hdf5_chk*"):
  ds = yt.load (file)
  yt.LinePlot (ds, ["density"], (0.5, 0.5, 0), (1.0, 0.5, 0), 1000 ).save()
```
4. To animate a sequence of .png files into a single output.mp4, one can use the ffmpeg command:

```
ffmpeg -i sedov_hdf5_chk_%04d_Slice_z_density.png -c:v libx264 -r 30 -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" output.mp4
```



## Summer school notes:

The notes for Prof. Fisher's ICESUN lectures can be found here.

- [Lecture Notes: "ICESUN Workshop Lecture Notes"](./fisher_icesun_lecture_notes.pdf)

