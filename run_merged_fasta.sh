#!/bin/bash

# Output file
OUTPUT_FILE="merged.fasta"

# Clear the output file if it exists
> "$OUTPUT_FILE"

# Loop through each FASTA file
for FILE in ./LGBBI*/**.fasta; do
  # Extract the filename
  BASENAME=$(basename "$FILE")
  
  # Add the header with the filename
  echo ">${BASENAME}" >> "$OUTPUT_FILE"
  
  # Append the content of the FASTA file (excluding its headers)
  grep -v '^>' "$FILE" >> "$OUTPUT_FILE"
done

echo "All FASTA files merged into $OUTPUT_FILE"
