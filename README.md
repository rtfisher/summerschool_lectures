# ICESUN Kunming Lectures on Hydrodynamics and Ideal Magnetohydrodynamics for Stellar Transients, 2024

This pages contains background reading and source code files for Prof. Fisher's [ICESUN Kunming Summer School](https://stellar-explosion2024.casconf.cn/) Lectures.

## Before the summer school:

1. Read the background reading.
- [Background Reading: "The Fundamental Equations of Hydrodynamics and Ideal Magnetohydrodynamics for Astrophysical Flows"](./hydro_equation_derivation.pdf)

2. Download and install the FLASH-X open source hydrodynamics code framework using Docker. Save the file as "flashx_dockerfile".
  - [Download flashx_dockerfile](https://raw.githubusercontent.com/rtfisher/summerschool_lectures/main/flashx_dockerfile)

Be sure that the full path of the directory to which you downloaded the file contains no spaces, as this may cause the following process to fail.
- Launch the Docker client. From the same directory where you have downloaded the Docker file, build the container and the code:
  <br>
  ```
  docker build -t flashx-app --progress=plain -f flashx_dockerfile .
  ```
- OR to build from scratch, one can _optionally_ use the --no-cache flag:
  <br>
  ```
  docker build --no-cache -t flashx-app --progress=plain -f flashx_dockerfile .
  ```
- The build process will take several minutes, depending on your internet connection. Once the build is successful, you will see the string "SUCCESS" after the link line.
  
3. To test run FLASH-X in a container named "flashx-container":
 ```  
 docker run --rm -it --name flashx-container --hostname buildkitsandbox flashx-app
```
The "--rm" flag deletes the container after it has completed execution.
- Once in the shell, run:
  ```
   ./flashx
  ```
- A successful run will output information for each timestep, terminating in "exiting: reached max SimTime". The docker container also installs the Python-based toolkit yt for analysis.

## Notes on Using Docker:

0. You may see an error message 'error getting credentials - err: exec: "docker-credential-desktop": executable file not found in $PATH, out: `" '. To fix this, simply edit the line storing your Docker credential preference in ~/.docker/config.json, changing "credsStore" to "credStore":

```
    "credStore": "desktop",
```

Save the config file and restart Docker. This appears to have been a bug in some older versions of Docker which has been fixed in more recent versions. It may arise on legacy systems (such as Intel architectures on older OS/X machines).


1. To copy files from Docker to your system, use the "docker cp" command. For example, to copy the contents of a folder called "figures" within the Flash-X object directory to your desktop, run the following from the command line on your system (not from within the Docker container): 
```
docker cp flashx-container:/home/flashuser/flashx/Flash-X/object/figures ~/Desktop/
```
Note the docker cp command does not accept wildcards ("*"), so it is better to organize the files you wish to copy over in directories.
2. To stop any running Docker containers, and to completely clean up the disk space used by Docker, you can use this one-line command:

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





## Summer school notes:

This section will contain notes relevant to the summer school, including the lecture slides, which will be made available afterwards.

