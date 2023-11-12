#!/bin/bash

# This script will be helped you for retrieving the file from your S3 bucket

bucket="$1"
amzFile="$2"
outputFile="$3"
resource="/${bucket}/${amzFile}"
contentType="application/x-compressed-tar"
dateValue=$(date -R)
stringToSign="GET\n\n${contentType}\n${dateValue}\n${resource}"
AWS_ACCESS_KEY_ID="$4"
AWS_SECRET_ACCESS_KEY="$5"
signature=$(echo -en "${stringToSign}" | openssl sha1 -hmac ${AWS_SECRET_ACCESS_KEY} -binary | base64)

echo -n "$(curl  -H "Host: ${bucket}.s3.amazonaws.com" \
     -H "Date: ${dateValue}" \
     -H "Content-Type: ${contentType}" \
     -H "Authorization: AWS ${AWS_ACCESS_KEY_ID}:${signature}" \
     https://${bucket}.s3.amazonaws.com/${amzFile} -o "$outputFile")" 