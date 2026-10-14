#!/usr/bin/env bash

# WARNING - ensure that pcloud is working
# disable Nextcloud synchronisation
# synchronize with rsync


NbProcessPcloud=`ps -ef|grep pcloud| grep -v grep | wc -l`
if [[ $NbProcessPcloud -ge 7 ]]; then

    ps -ef | grep '\/opt\/Nextcloud' | awk '{print $2}' | xargs kill

    cd 
    rsync -av --delete pCloudDrive/MesDocuments/ Nextcloud/MesDocuments
    rsync -av --delete pCloudDrive/Commun/ Nextcloud/Commun

    /opt/Nextcloud > /dev/null 2>&1&
    echo "Synchro finished and Nextcloud relaunched"
else
    echo "pCloud is not launched => stop"
fi
