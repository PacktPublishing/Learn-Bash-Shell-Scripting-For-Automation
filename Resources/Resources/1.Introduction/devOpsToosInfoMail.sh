#!/bin/bash

which java 1>/dev/null 2>/dev/null
if [[ $? -eq 0 ]]
then
  javaVersion=$(java -version 2>&1 | awk 'NR==1{print $3}' | tr -d '"')
else
  javaVersion="Java Not Found"
fi

which jenkins 1>/dev/null 2>/dev/null
if [[ $? -eq 0 ]]
then
  jenkinsVersion=$(cat /var/lib/jenkins/config.xml  | grep '<version>' | awk -F'[<>]' '{ print $3}')
else
  jenkinsVersion="NotFound"
fi

which nginx 1>/dev/null 2>/dev/null
if [[ $? -eq 0 ]]
then
  nginxVersion=$(nginx -version 2>&1 | awk -F'/' '{print $NF}')
else
  nginxVersion="Nginx Not Found"
fi

which docker  1>/dev/null 2>/dev/null
if [[ $? -eq 0 ]]
then
  dockerVersion=$(docker --version | awk '{print $3}' | tr -d ",")
else
  dockerVersion="Docker Not Found"
fi

which ansible 1>/dev/null 2>/dev/null
if [[ $? -eq 0 ]]
then
  ansibleVersion=$(ansible --version | awk 'NR==1{print $2}')
else
  ansibleVersion="Ansible Not Found"
fi

cat << EOF | mailx -s "$(echo -e "DevOps Tools Info on $(hostname)\nContent-Type: text/html")" ubuntugtest@gmail.com
<!DOCTYPE html>
<html>

<head>
    <title>
         Automation By VRTechnologies
    </title>
</head>

<body>
    <h2>Please Find Below Table For DevOps Tools Versions </h1>
    <table border="1">
        <tr>
            <th>ToolName</th>
            <th>Version</th>
        </tr>
        <tr>
            <td>Java</td>
            <td>${javaVersion}</td>
        </tr>
        <tr>
            <td>Jenkins</td>
            <td>${jenkinsVersion}</td>
        </tr>
        <tr>
            <td>Nginx</td>
            <td>${nginxVersion}</td>
        </tr>
        <tr>
            <td>Docker</td>
            <td>${dockerVersion}</td>
        </tr>
        <tr>
            <td>Ansible</td>
            <td>${ansibleVersion}</td>
        </tr>
    </table>
</body>

</html>
EOF

