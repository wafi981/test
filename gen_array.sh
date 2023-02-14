#!/bin/bash


repo="https://charts.helm.sh/incubator"

# Add the chart repository
helm repo add incubator "$repo"

# Update the chart repository index
helm repo update

# Search for charts in the repository
output=$(helm search repo incubator)

# Extract the chart names from the search output and store them in an array
charts=($(echo "$output" | awk '{print $1}' | grep -v NAME))

# Store the chart names in a file
echo "Charts in the repository:" > array
printf '%s\n' "${charts[@]}" >> array
