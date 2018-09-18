#!/bin/bash
profile=""

allBucketNames=()
checkLifeCyclePolicy=()

while IFS= read -r line; do
    allBucketNames+=( "$line" )
done < <( aws s3 --profile $profile ls s3:// --recursive | awk '{print $3}' )

allBucketCount=${#allBucketNames[@]}

for ((i=0; i<$allBucketCount; i++))
do
    checkPolicy=$(aws s3api get-bucket-lifecycle --bucket ${allBucketNames[$i]} --profile $profile --output text > /dev/null 2>&1)
    if [ $? -eq 0 ];
    then
        echo ${allBucketNames[$i]} >> lifecycle.txt
    fi
done
