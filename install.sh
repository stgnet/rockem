#!/bin/sh

if [ ! -d processing-2.0b1 ]
then
	wget -O - http://processing.googlecode.com/files/processing-2.0b1-linux64.tgz |tar xvfz -
fi

if [ ! -d OpenNI_NITE_Installer-Linux64-0.27 ]
then
	wget -O OpenNI_Installer.zip http://simple-openni.googlecode.com/files/OpenNI_NITE_Installer-Linux64-0.27.zip
	unzip OpenNI_Installer.zip

	(cd OpenNI_NITE_Installer-Linux64-0.27/NITE-Bin-Dev-Linux-x64-v1.5.2.21; sudo ./install.sh)
	(cd OpenNI_NITE_Installer-Linux64-0.27/OpenNI-Bin-Dev-Linux-x64-v1.5.4.0; sudo ./install.sh)

	#OpenNI_NITE_Installer-Linux64-0.27/Sensor-Bin-Linux-x64-v5.1.2.1/install.sh
	#OpenNI_NITE_Installer-Linux64-0.27/kinect/Sensor-Bin-Linux-x64-v5.1.2.1/install.sh
fi


if [ ! -f SimpleOpenNI-0.27.zip ]
then
	wget -O SimpleOpenNI-0.27.zip http://simple-openni.googlecode.com/files/SimpleOpenNI-0.27.zip

	mkdir -p processing-2.0b1/sketchbook/libraries
	(cd processing-2.0b1/sketchbook/libraries; ls ../../..;unzip ../../../SimpleOpenNI-0.27.zip)
fi

