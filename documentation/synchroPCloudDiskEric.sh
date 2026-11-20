#!/usr/bin/env bash

# WARNING - ensure that pcloud is working
# disable Nextcloud synchronisation
# synchronize with rsync


NbProcessPcloud=`ps -ef|grep pcloud| grep -v grep | wc -l`
if [[ $NbProcessPcloud -ge 7 ]]; then

    cd 
    rsync -av --delete pCloudDrive/MesDocuments/ /media/eric/DiskEric/MesDocuments
    rsync -av --delete pCloudDrive/Commun/ /media/eric/DiskEric/Commun
    rsync -av --delete pCloudDrive/CommunPhotos/ /media/eric/DiskEric/CommunPhotos

    echo "Synchro finished"
else
    echo "pCloud is not launched => stop"
fi
