# ICESUN Kunming Lectures on Hydrodynamics and Ideal Magnetohydrodynamics for Stellar Transients, 2024

This pages contains background reading and source code files for Prof. Fisher's ICESUN Kunming Summer Lectures.

## Before the summer school:

1. Read the background reading.
- [Background Reading: "The Fundamental Equations of Hydrodynamics and Ideal Magnetohydrodynamics for Astrophysical Flows"](./hydro_equation_derivation.pdf)

2. Download and install the FLASH-X open source hydrodynamics code framework using Docker. Save the file as "flashx_dockerfile".
  - [Download flashx_dockerfile](https://raw.githubusercontent.com/rtfisher/summerschool_lectures/main/flashx_dockerfile)

Be sure that the full path of the directory to which you downloaded the file contains no spaces, as this may cause the following process to fail.
- From the same directory where you have downloaded the Docker file, build the container and the code:
  ```sh
  docker build -t flashx-app --progress=plain -f flashx_dockerfile .```
- OR to build from scratch, one can _optionally_ use the --no-cache flag:
  ```sh
  docker build --no-cache -t flashx-app --progress=plain -f flashx_dockerfile .```
- The build process will take several minutes, depending on your internet connection. Once the build is successful, you will see the string "SUCCESS" after the link line.
  
3. To test run FLASH-X, get an interactive shell from Docker:
```sh
 docker run --rm -it --hostname buildkitsandbox --entrypoint /bin/bash flashx-app```
- Once in the shell, run:
  - ./flashx
- A successful run will output information for each timestep, terminating in "exiting: reached max SimTime".

4. To stop any running Docker containers, and to completely clean up the disk space used by Docker, you can use this one-line command:

```sh
docker stop $(docker ps -aq) && docker rm $(docker ps -aq) && docker rmi -f $(docker images -aq) && docker volume rm $(docker volume ls -q) && docker network rm $(docker network ls -q) && docker builder prune -a -f && docker system prune
```

Note that this command will erase _all_ Docker workspace, including any other Docker containers you have on your machine, and should _only_ be used if you do not need any prior Docker containers.



## Summer school notes:

This section will contain notes relevant to the summer school, including the lecture slides, which will be made available afterwards.

