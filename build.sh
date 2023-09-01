#!/bin/bash

#set -euo pipefail
#set -x

################################################################################
#
# The following script should work if you have petalinux 2022.1 and Vivado
# 2022.1 in the path.  A few very common utilities are also used.  This will
# build PYNQ v3.0.1 for TySOM-3-ZU7EV and TySOM-3A-ZU19EG
#
# Adjust file names and paths of shell variables if needed.
#
################################################################################

if [ "$#" -eq 1 ]; then
	if [ "$1" -eq 1 ]; then
		BOARD_TYPE=TySOM-3-ZU7EV
	else
		BOARD_TYPE=TySOM-3A-ZU19EG
	fi
else
	echo "Usage: build.sh <1 or 2>"
	echo "   1 -> build TySOM-3-ZU7EV PYNQ"
	echo "   2 -> build TySOM-3A-ZU19EG PYNQ"
	exit -1
fi
	
##################################
# Various path and file settings #
##################################

START_DIR=$PWD
MAIN_DIR=$START_DIR/build

SD_IMAGE_FILE=$START_DIR/$BOARD_TYPE-3.0.1.img

PYNQ_GIT_LOCAL_PATH=$MAIN_DIR/PYNQ
PYNQ_IMAGE_FILE=$PYNQ_GIT_LOCAL_PATH/sdbuild/output/$BOARD_TYPE-3.0.1.img
PYNQ_GIT_TAG=v3.0.1
PYNQ_GIT_REPO_URL=https://github.com/Xilinx/PYNQ
PYNQ_PATCH=$START_DIR/patch/0001-fixes-for-aldec-boards.patch

ALDEC_BOARDDIR=$START_DIR
OVERLAY_FILE_PATH=$ALDEC_BOARDDIR/$BOARD_TYPE/base
OVERLAY_NAME=base
OVERLAY_SEMA_NAME="_""$BOARD_TYPE""_"
BSP_FILE_PATH=$ALDEC_BOARDDIR/$BOARD_TYPE
BSP_FILE_URL=https://github.com/aldec/TySOM-PYNQ/raw/3.0.1/$BOARD_TYPE
BSP_FILE=$BOARD_TYPE"_pynq.bsp"

ROOTFS_TMP_DIR=$MAIN_DIR/pre-built
ROOTFS_ZIP_FILE=jammy.aarch64.3.0.1.tar.gz
ROOTFS_IMAGE_FILE=jammy.aarch64.3.0.1.tar
ROOTFS_IMAGE_FILE_URL=https://www.xilinx.com/bin/public/openDownload?filename=jammy.aarch64.3.0.1.tar.gz
PREBUILT_IMAGE_ZIP_FILE=pynq-3.0.1.tar.gz
PREBUILT_IMAGE_FILE_URL=https://github.com/Xilinx/PYNQ/releases/download/v3.0.1/pynq-3.0.1.tar.gz

##################################
# Fetching and compiling         #
##################################
echo "Status: building from location: $START_DIR"
echo "Status: creating dir "$ROOTFS_TMP_DIR" to store rootfs tarball"
mkdir -p $ROOTFS_TMP_DIR

[ ! -e $START_DIR/ip ] && ln -s $PYNQ_GIT_LOCAL_PATH/boards/ip $START_DIR
[ ! -e $START_DIR/sw_repo ] && ln -s $PYNQ_GIT_LOCAL_PATH/boards/sw_repo $START_DIR

if [ -d "$PYNQ_GIT_LOCAL_PATH" ]; then
	echo "Status: PYNQ repo -> already cloned $PYNQ_GIT_LOCAL_PATH"
else
	echo "Status: Fetching PYNQ git $PYNQ_GIT_LOCAL_PATH"
	git clone --branch $PYNQ_GIT_TAG $PYNQ_GIT_REPO_URL $PYNQ_GIT_LOCAL_PATH --single-branch
	echo "Status: PYNQ repo cloned tag: $PYNQ_GIT_TAG"
fi

if [ -d "$PYNQ_GIT_LOCAL_PATH/boards/Pynq-Z1" ]; then
	echo "Status: Removing boards to speed up build time and eliminate needing hdmi license"
	cd $PYNQ_GIT_LOCAL_PATH
	git rm -rf $PYNQ_GIT_LOCAL_PATH/boards/ZCU104
	git rm -rf $PYNQ_GIT_LOCAL_PATH/boards/Pynq-Z1
	# The changes must be committed because PYNQ clones local when it builds
	git commit -am 'remove boards'
	echo "Status: Removed other boards"
	cd $START_DIR
else
	echo "Status: Unused board dirs -> removed prior"
fi

if [ -f "$ROOTFS_TMP_DIR/$ROOTFS_IMAGE_FILE" ]; then 
	echo "Status: Image file $ROOTFS_TMP_DIR/$ROOTFS_IMAGE_FILE -> already exists"
else
	echo "Status: Fetching pre-built rootfs"
	if [ -f "$ROOTFS_TMP_DIR/$ROOTFS_ZIP_FILE" ]; then
		echo "Status: zip file -> already exists"
	else
		wget --no-check-certificate "$ROOTFS_IMAGE_FILE_URL" -O "$ROOTFS_TMP_DIR/$ROOTFS_ZIP_FILE"
	fi
	if [ -s $ROOTFS_TMP_DIR/$ROOTFS_ZIP_FILE ]; then
		gzip -d "$ROOTFS_TMP_DIR/$ROOTFS_ZIP_FILE" 
		echo "Status: rootfs unzipped"
	else
		rm "$ROOTFS_TMP_DIR/$ROOTFS_ZIP_FILE"
		echo "Error: Failed to fetch rootfs zip file!"
		exit -1
	fi
fi

if [ -f "$BSP_FILE_PATH/$BSP_FILE" ]; then 
	echo "Status: $BSP_FILE -> already exists"
else
	echo "Status: Fetching pre-built BSP"
	wget "$BSP_FILE_URL/$BSP_FILE" -O "$BSP_FILE_PATH/$BSP_FILE"
	if ! [ -s "$BSP_FILE_PATH/$BSP_FILE" ]; then
		rm "$BSP_FILE_PATH/$BSP_FILE"
		echo "Error: Failed to fetch bsp file!"
		exit -1
	fi
fi

if [ -f "$OVERLAY_FILE_PATH/$OVERLAY_NAME.bit" -a -f "$OVERLAY_FILE_PATH/$OVERLAY_NAME.hwh" ] ; then
	echo "Status: $OVERLAY_NAME -> .bit and .hwh already exists"
else
	echo "Status: Building default $OVERLAY_NAME Overlay"
	cd "$OVERLAY_FILE_PATH"
	make clean
	make
	if [ -f "$OVERLAY_NAME.bit" -a -f "$OVERLAY_NAME.hwh" ]; then
	touch "$OVERLAY_FILE_PATH/$OVERLAY_SEMA_NAME"
		echo "Status: Overlay build SUCCESS but did not verify timing, manually check build log!"
	else
		echo "Status: Overlay build FAILURE"
		exit -1
	fi
fi

cd "$PYNQ_GIT_LOCAL_PATH"
git apply --check --reverse $PYNQ_PATCH
if [ $? -eq 1 ]; then
	git apply $PYNQ_PATCH
	git commit -am "fixes for Aldec boards"
else
	echo "Patch already applied"
fi

echo "Status: Fetching pre-built rootfs"
wget --no-check-certificate -c "$ROOTFS_IMAGE_FILE_URL" -O "$ROOTFS_TMP_DIR/$ROOTFS_ZIP_FILE"
if ! [ -f "$ROOTFS_TMP_DIR/$ROOTFS_ZIP_FILE" ]; then
	echo "Error: Image file $ROOTFS_TMP_DIR/$ROOTFS_ZIP_FILE -> does not exist"
	exit -1
fi

echo "Status: Fetching pre-built PYNQ image file"
wget --no-check-certificate -c "$PREBUILT_IMAGE_FILE_URL" -O "$ROOTFS_TMP_DIR/$PREBUILT_IMAGE_ZIP_FILE"
if ! [ -f "$ROOTFS_TMP_DIR/$PREBUILT_IMAGE_ZIP_FILE" ]; then
	echo "Error: Image file $ROOTFS_TMP_DIR/$PREBUILT_IMAGE_ZIP_FILE -> does not exist"
	exit -1
fi

# For PYNQ v3.0 these files must be located under the PYNQ git, so save a copy and just softlink
ln -fs $ROOTFS_TMP_DIR/$ROOTFS_ZIP_FILE $PYNQ_GIT_LOCAL_PATH/sdbuild/prebuilt/pynq_rootfs.aarch64.tar.gz
ln -fs $ROOTFS_TMP_DIR/$PREBUILT_IMAGE_ZIP_FILE $PYNQ_GIT_LOCAL_PATH/sdbuild/prebuilt/pynq_sdist.tar.gz

cd "$PYNQ_GIT_LOCAL_PATH/sdbuild"
make clean
echo "Status: Building PYNQ SD Image & removed prior PYNQ build (if it existed)"
make PREBUILT=$ROOTFS_TMP_DIR/$ROOTFS_ZIP_FILE BOARDDIR=$ALDEC_BOARDDIR BOARDS=$BOARD_TYPE

if [ -f "$PYNQ_IMAGE_FILE" ]; then
	mv -f "$PYNQ_IMAGE_FILE" "$SD_IMAGE_FILE"
	echo "Status: Done building PYNQ image: $SD_IMAGE_FILE"
else
	echo "Status: PYNQ build FAILED"
	exit -1
fi

exit 0
