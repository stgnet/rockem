#!/bin/sh

if [ 'uname -i' = 'x86_64' ]
then
	PLATFORM="x64"
	BITS="64"
else
	PLATFORM="x86"
	BITS="32"
fi

PROCESSING_URL="http://processing.googlecode.com/files/processing-2.0b1-linux$BITS.tgz"
PROCESSING="processing-2.0b1"

NITE_URL="http://simple-openni.googlecode.com/files/OpenNI_NITE_Installer-Linux$BITS-0.27.zip"
NITE="OpenNI_NITE_Installer-Linux$BITS-0.27"

SIMPLE_URL="http://simple-openni.googlecode.com/files/SimpleOpenNI-0.27.zip"

if [ ! -d $PROCESSING ]
then
	wget -O - $PROCESSING_URL |tar xvfz -
fi

if [ ! -d $NITE ]
then
	wget -O OpenNI_Installer.zip $NITE_URL
	unzip OpenNI_Installer.zip

	(cd $NITE/NITE-Bin-Dev-Linux-$PLATFORM-v1.5.2.21; sudo ./install.sh)
	(cd $NITE/OpenNI-Bin-Dev-Linux-$PLATFORM-v1.5.4.0; sudo ./install.sh)

	#$NITE/Sensor-Bin-Linux-x64-v5.1.2.1/install.sh
	#$NITE/kinect/Sensor-Bin-Linux-x64-v5.1.2.1/install.sh
fi


SIMPLE_ZIP="SimpleOpenNI.zip"

if [ ! -f $SIMPLE_ZIP ]
then
	wget -O $SIMPLE_ZIP $SIMPLE_URL

	mkdir -p $PROCESSING/sketchbook/libraries
	(cd $PROCESSING/sketchbook/libraries; ls ../../..;unzip ../../../$SIMPLE_ZIP)
fi

./$PROCESSING/processing rockem.pde

