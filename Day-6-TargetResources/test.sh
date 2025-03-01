#!/bin/bash
resources=(
    "aws_instance.dev"
 "aws_s3_bucket.bucketdev"
)
for resource in "${resources[@]}"; do
targets+=" -target=$resource"
done

terraform apply $targets