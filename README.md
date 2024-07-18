
# ICESUN Kunming Lectures on Hydrodynamics and Ideal Magnetohydrodynamics for Stellar Transients, 2024

This pages contains background reading and source code files for Prof. Fisher's ICESUN Kunming Summer Lectures.

## Before the summer school:

1. Read the background reading.
- [Background Reading: "The Fundamental Equations of Hydrodynamics and Ideal Magnetohydrodynamics for Astrophysical Flows"](./hydro_equation_derivation.pdf)

2. Download and install the FLASH-X open source hydrodynamics code framework using Docker:Do
  - Download [flashx_dockerfile](https://github.com/rtfisher/summerschool_lectures/flashx-dockerfile)
- From the same directory where you have downloaded the Docker file, build the container and the code:
  - docker build --no-cache -t flashx-app --progress=plain -f flashx_dockerfile .
- If the build is successful, you will see the string "SUCCESS" after the link line.
  
3. To test run FLASH-X, get an interactive shell from Docker:
  - docker run --rm -it --entrypoint /bin/bash flashx-app
- Once in the shell, run:
  - ./flashx  

## About

More to be included....
