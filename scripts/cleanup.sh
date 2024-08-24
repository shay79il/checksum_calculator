#!/bin/bash

bucket_name="$1"
script_path="$2"


echo "Deleting all files from S3 bucket: $bucket_name"
aws s3 rm s3://"$bucket_name"/ --recursive

if [ $? -eq 0 ]; then
    echo "All files successfully deleted from bucket: $bucket_name"
else
    echo "Error: Failed to delete files from bucket: $bucket_name"
    exit 1
fi

echo "Removing all local files in the pdf_files/ directory"
rm -rf "$(script_path)"/pdf_files/*

if [ $? -eq 0 ]; then
    echo "All local files successfully removed from the pdf_files/ directory"
else
    echo "Error: Failed to remove local files from the pdf_files/ directory"
    exit 1
fi

echo "Cleanup completed successfully."