# Project_Octopus_Jackie

## Obtaining all paths 
Get the paths to the raw files 
```
find /data/bigdata/vanessab/sequencing_data/01.RawData -type f -name "*.gz" | sort -t'/' -k7,7
```
Get the folder names 
```
find /data/bigdata/vanessab/sequencing_data/01.RawData -type f -name "*.gz" | awk -F'/' '{print $7}' | sort | uniq
```
