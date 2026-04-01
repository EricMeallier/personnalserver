#!/bin/sh

cd /opt/nextcloud; sudo -u nobody /usr/bin/php{{ php.version }} occ app:update --all