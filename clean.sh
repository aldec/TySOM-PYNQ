#!/bin/bash 

rm -rf build

if [ -L ip ] ; then
	unlink ip 
fi
if [ -L sw_repo ] ; then
	unlink sw_repo
fi

cd TySOM-3-ZU7EV/base/
make clean
cd -

cd TySOM-3A-ZU19EG/base/
make clean
cd -

printf "Directory cleaned\n"
