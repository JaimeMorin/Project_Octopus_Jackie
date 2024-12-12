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
## Adapter Removal 
First, create a subfolder for every sample in:
```
/data/bigexpansion/jaime/000_BIGTREE/Jackie_Octopus/00_CleanReads
```
Set every AdapterRemoval run on:
```
run_adapter_removal.sh 
```
Give executable rights 
```
chmod +x run_adapter_removal.sh
```
Run AdapterRemoval
```
./run_adapter_removal.sh
```
Now, add the ".fq" extension (files are within subfolders) 
```
find . -type f -name "*.truncated" -exec sh -c 'f="{}"; mv -- "$f" "$(dirname "$f")/$(basename "${f%.truncated}").truncated.fq"' \; 
```
## NovoPlasty
Create a config file for every sample (v4.3), then set run_novoplasty.sh, make sure to set the output folder to each config.txt
```
run_novoplasty.sh
```
Give executable rights 
```
chmod +x run_novoplasty.sh
```
Activate the environment
```
conda activate mitgen
```
Run NovoPlasty
```
./run_novoplasty.sh
```



