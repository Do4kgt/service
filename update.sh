#!/bin/bash

#   Copyright (C) 2020 by Tobias Blouw - DO4KGT
#	Updatescript DMRIds.dat from MMDVMHost
	
# Stop MMDVMHost Services 
sudo systemctl stop mmdvmhost

# Stop DMRGateway
sudo systemctl stop dmrgateway

# LÃ¶schen DMRids.dat
sudo rm /opt/dmr/MMDVMHost/DMRIds.dat

#Download DMRids.dat 
wget https://ham-digital.org/status/DMRIds.dat -P /opt/dmr/MMDVMHost/

# LÃ¶schen stripped.csv
sudo rm /opt/dmr/MMDVMHost/Nextion/stripped.csv

#Download DMRids.dat 
sudo wget http://files.ham-dmr.be/UserDB/stripped.csv -P /opt/dmr/NextionDriver/

# Start MMDVMHost Service 
sudo systemctl start mmdvmhost

#Start DMRGateway Service
sudo systemctl start dmrgateway 

