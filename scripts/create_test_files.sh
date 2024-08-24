#!/bin/bash

bucket_name="$1"
script_path="$2"

mkdir -p "$script_path"/pdf_files

for i in {1..100}
do
  touch "$script_path"/pdf_files/file"$i".pdf
done

echo "100 PDF files created in the pdf_files directory."


#
## Upload all PDF files in the pdf_files directory to the specified S3 bucket
aws s3 cp "$script_path"/pdf_files/ s3://"$bucket_name"/ --recursive