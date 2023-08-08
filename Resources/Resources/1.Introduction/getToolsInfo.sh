#!/bin/bash

javaVersion=$(java -version 2>&1  | awk 'NR==1{print $3}' | tr -d '"')

gitVersion=$(git --version | awk '{print $3}')

nginxVersion=$(nginx -version 2>&1 | awk -F'/' '{print $NF}')

dockerVersion=$(docker --version | awk '{print $3}' | tr -d ",")

ansibleVersion=$(ansible --version | awk 'NR==1{print $2}')

cat << EOF
ToolName     : Version
java	     : ${javaVersion} 
git          : ${gitVersion}
nginx        : ${nginxVersion}
docker       : ${dockerVersion}
ansible      : ${ansibleVersion}
EOF

