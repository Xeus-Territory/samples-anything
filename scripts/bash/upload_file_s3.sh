#!/bin/bash

# This script will help you upload a new file into S3 bucket

file="FILEPATH"
bucket="BUCKET_NAME"
folder="FOLDER_IN_BUCKET"
resource="/${bucket}/${folder}/${file}"
contentType="text/plain"
dateValue=$(date -R)
s3Key="S3KEY"
s3Secret="S3SECRET"

# Check if the file exists on S3
httpResponseCode=$(curl -I -s -o /dev/null -w "%{http_code}" -X HEAD -H "Host: ${bucket}.s3.amazonaws.com" "https://${bucket}.s3.amazonaws.com/${folder}/${file}")

if [ $httpResponseCode -eq 200 ]; then
  # If the file exists, delete it
  deleteDateValue=$(date -R)
  deleteResource="/${bucket}/${folder}/${file}"
  deleteStringToSign="DELETE\n\n\n${deleteDateValue}\n${deleteResource}"
  deleteSignature=$(echo -en "${deleteStringToSign}" | openssl sha1 -hmac "${s3Secret}" -binary | base64)

  # Send the DELETE request
  curl -X DELETE -H "Host: ${bucket}.s3.amazonaws.com" -H "Date: ${deleteDateValue}" -H "Authorization: AWS ${s3Key}:${deleteSignature}" "https://${bucket}.s3.amazonaws.com/${folder}/${file}"
  echo ">>>>>>>>>>>>>>>>>>> An existing file was deleted successfully!"
fi

# Now, upload the new file
stringToSign="PUT\n\n${contentType}\n${dateValue}\n${resource}"
signature=$(echo -en "${stringToSign}" | openssl sha1 -hmac "${s3Secret}" -binary | base64)

# Send the PUT request to upload the new file
curl -L -X PUT -T "${file}" -H "Host: ${bucket}.s3.amazonaws.com" -H "Date: ${dateValue}" -H "Content-Type: ${contentType}" -H "Authorization: AWS ${s3Key}:${signature}" "https://${bucket}.s3.amazonaws.com/${folder}/${file}"
echo ">>>>>>>>>>>>>> A new file was uploaded successfully!"