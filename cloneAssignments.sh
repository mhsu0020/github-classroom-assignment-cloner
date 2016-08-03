#!/bin/bash

organization=$1
assignment=$2
studentAccountFile=$3

if [[ -z "$organization" ]]; then
  echo missing organization
  exit 1
fi

if [[ -z "$assignment" ]]; then
  echo missing assignment
  exit 1
fi

if [[ -z "$studentAccountFile" ]]; then
  echo missing studentAccountFile
  exit 1
fi

echo Organization: $organization;
echo Assignment to clone: $assignment;
echo Student account file: $studentAccountFile;

while IFS=, read username name; do
    echo cloneing repo for student $name with username $username
    repoURL=https://github.com/$organization/$assignment-$username
    echo repo url is: $repoURL
    git clone $repoURL
done < $studentAccountFile
