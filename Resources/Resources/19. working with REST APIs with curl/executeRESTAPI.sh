#!/bin/bash

# stCode=$(curl -s -w "%{http_code}" -X GET http://127.0.0.1:5000/getCreds -o myInfo.json) 
# if [[ ${stCode} -eq 200 ]] ; then 
#     echo "REST API executed successfully"
#     cat  myInfo.json
# else 
#     echo "Failed"
# fi 

getJsonData()
{
    cat << EOF
    {
        "input" : "${1}"
    }
EOF
}

read -p "Enter your data: " INPUT

statusCode=$(curl -s -X GET -w "%{http_code}" --header 'Content-Type: application/json' 'http://127.0.0.1:5000/upper'  --data "$(getJsonData ${INPUT})" -o upperData.json)
if [[ ${statusCode} -eq 200 ]] ; then 
    echo "REST API executed successfully"
    cat  upperData.json
else 
    echo "Failed"
fi 