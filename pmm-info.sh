#!/bin/bash
# Created by Roel Van de Paar, Percona LLC

echo 'QA PMM Info Script v0.03'
echo '==================== uname -a'
uname -a 2>&1 | sed 's|^|  |'
echo '==================== /proc/version'
cat /proc/version 2>&1 | sed 's|^|  |'
echo '==================== OS Release (filtered cat /etc/*-release):'  # With thanks, http://www.cyberciti.biz/faq/find-linux-distribution-name-version-number/
cat /etc/*-release 2>&1 | grep -Ev '^$|^CENTOS_|^REDHAT_|^CPE_|^BUG_|^ANSI_' | sort -u | sed 's|^|  |'
echo '==================== Docker release (docker --version):'
docker --version 2>&1 | sed 's|^|  |'
echo '==================== SELinux status if present (sestatus):'
sestatus 2>&1 | sed 's|^|  |'
echo '==================== PMM server (sudo docker images | grep pmm):'
sudo docker images 2>&1 | grep pmm | sed 's|^|  |'
echo '==================== PMM agent (sudo pmm-admin --version):'
sudo pmm-admin --version 2>&1 | sed 's|^|  |'
