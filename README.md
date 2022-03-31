# PYNQ v2.7 for Aldec boards

## Table of Content
- [Description](#description)
- [Pre-built images](#pre-built)
- [Rebuild PYNQ image](#rebuild)
- [References](#references)

<a name="description"/>

## Description
![PYNQ](https://raw.githubusercontent.com/Xilinx/PYNQ/master/logo.png)

PYNQ is an open-source project from Xilinx® that makes it easier to use Xilinx platforms.

Using the Python language and libraries, designers can exploit the benefits of programmable logic and microprocessors to build more capable and exciting electronic systems.

The repository adds support for Aldec boards based on Xilinx Zynq Ultrascale+:
- [TySOM-3-ZU7EV](https://www.aldec.com/en/products/emulation/tysom_boards/zynq_ultrascale_mpsoc/tysom_3_zu7ev)
- [TySOM-3A-ZU19EG](https://www.aldec.com/en/products/emulation/tysom_boards/zynq_ultrascale_mpsoc/tysom_3a_zu19eg)

![Aldec, Inc.](https://www.aldec.com/images/content/corporate/Corporate_Logo_Aldec_Crescent.png)

<a name="pre-built"/>

## Pre-built PYNQ images
Download pre-built PYNQ 2.7.0 image for TySOM-3-ZU7EV or TySOM-3A-ZU19EG:
- [TySOM-3-ZU7EV PYNQ v2.7 image](https://github.com/aldec/TySOM-PYNQ/releases/download/2.7/tysom3_v2.7.0.img.7z)
- [TySOM-3A-ZU19EG PYNQ v2.7 image](https://github.com/aldec/TySOM-PYNQ/releases/download/2.7/tysom3a_v2.7.0.img.7z)

Using pre-built image is a preferred way to use PYNQ with TySOM boards.

#### Flash SD with PYNQ image
Extract the downloaded 7z package and flash a micro SD card with PYNQ image.

Use Balena Etcher or Win32 Disk Imager to copy the .img file onto an SD card 16GB or larger.

<a name="rebuild"/>

## Build own image
Advanced users can build own image. The build process takes several hours to finish. 
#### Requirements
- Ubuntu 18.04 or 20.04 host machine (can be virtual)
- installed Xilinx Vivado 2020.2 tool
- installed Xilinx Petalinux 2020.2 tool
- sudo privileges
- at least 80 GB of free disk space for build process
- recommended 16 GB RAM for host machine

#### Build steps

First step is to download Aldec TySOM-PYNQ repository.

This repository contains larg files stored in Git Large File Storage (LFS). To clone this repository with LFS contents you should:

Download and install [Git Large File Storage](https://git-lfs.github.com/).

Set up Git LFS for your user account.
```
git lfs install
```
Clone the repository.
```
git clone -b 2.7 https://github.com/aldec/TySOM-PYNQ.git
cd TySOM-PYNQ
```
The repository contains board files for Aldec boards and script for preparing PYNQ image. The script downloads PYNQ source, generic PYNQ image and build all components.

Before running the script, source settings file for Vivado 2020.2 and Petalinux 2020.2.
````
source <vivado_2020_2_path>/settings64.sh
source <petalinux_2020_2_path>/settings.sh
````

Build the image for TySOM-3-ZU7EV:
```
./build.sh 1
```
or TySOM-3A-ZU19EG:
```
./build.sh 2
```

If the build crashes due to not satisfied software requirements then run setup_host.sh script:
```
./build/PYNQ/sdbuild/scripts/setup_host.sh
```
and rerun build.sh.

<a name="references"/>

### References
For more information about PYNQ refer to:
- [PYNQ documentation](https://pynq.readthedocs.io/en/v2.7.0/)
- [Getting started](https://pynq.readthedocs.io/en/v2.7.0/getting_started.html)
- [PYNQ project website](http://www.pynq.io/)
- [PYNQ community forum](https://discuss.pynq.io/)


Visit Aldec website to check TySOM family products:
[https://www.aldec.com/en/products/embedded/tysom](https://www.aldec.com/en/products/embedded/tysom)

![TySOM-3-ZU7EV](https://www.aldec.com/images/content/products/tysom_boards/zynq_7000/tysom_3_view.jpg "TySOM-3-ZU7EV")
