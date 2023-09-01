#!/bin/bash 

sudo rm -fr build/PYNQ/sdbuild/ccache
sudo rm -fr build/PYNQ/sdbuild/build/jammy.TySOM-3A-ZU19EG/
rm -rf build

if [ -L ip ] ; then
	unlink ip 
fi
if [ -L sw_repo ] ; then
	unlink sw_repo
fi

if [ -d TySOM-3-ZU7EV/base/ ]; then
	cd TySOM-3-ZU7EV/base/
	make clean
	cd -
fi

if [ -d TySOM-3A-ZU19EG/base/ ]; then
	cd TySOM-3A-ZU19EG/base/
	make clean
	cd -
fi

printf "Directory cleaned\n"
