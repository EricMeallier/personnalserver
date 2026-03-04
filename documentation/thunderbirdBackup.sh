#!/bin/sh

timestamp=`date +%Y%m%d_%H%M`
timestamp='last'
targetDir='/home/eric/pCloudDrive/BackupPC/MailThunderbird'
targetName=${timestamp=}.thunderbird
profileToBackup='EricNew2'


# Arret du soft
PID=`ps -ef |grep 'thunderbird ' | grep parentPid | tail -1 | sed 's/.*parentPid \([^ ]*\).*/\1/'`
kill $PID

# Archivage des données
cd ~/.thunderbird
tar cvf ${targetName}.tar ${profileToBackup}

# Relance du soft
thunderbird&

# Compression + déplacement
7z a -m0=lzma2 -mx9 ${targetName}.7z ${targetName}.tar
mv ${targetName}.7z ${targetDir}

exit $?
