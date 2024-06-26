#!/bin/bash

MAX_SIZE_KB=100

MAX_SIZE_BYTES=$((MAX_SIZE_KB * 1024))

for file in *.log; do
  
  if [ -f "$file" ]; then
    
    file_size=$(wc -c < "$file")
    
    # If file size > maximum size
    if [ "$file_size" -gt "$MAX_SIZE_BYTES" ]; then
      
      tail -c "$MAX_SIZE_BYTES" "$file" > "$file.tmp"
      
      mv "$file.tmp" "$file"
      
      echo "Trimmed $file to $MAX_SIZE_KB KB"
    else
      echo "$file is already under $MAX_SIZE_KB KB"
    fi
  fi
done
