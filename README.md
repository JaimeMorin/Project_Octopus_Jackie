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
Now you should have something like this:
```
$ ls /data/bigexpansion/jaime/000_BIGTREE/Jackie_Octopus/01_NovoPlasty

LGBBI0550  LGBBI0553  LGBBI0556  LGBBI0559  LGBBI0563  LGBBI0566  LGBBI0569 ... 
```
Within each folder you should have one or two fasta files 
```
$ find .  -type f -name "*.fasta"

./LGBBI0569/Option_1_LGBBI0569.fasta
./LGBBI0569/Contigs_1_LGBBI0569.fasta
./LGBBI0592/Contigs_1_LGBBI0592.fasta
./LGBBI0563/Contigs_1_LGBBI0563.fasta
./LGBBI0563/Option_1_LGBBI0563.fasta
./LGBBI0556/Contigs_1_LGBBI0556.fasta
./LGBBI0556/Option_1_LGBBI0556.fasta
./LGBBI0566/Circularized_assembly_1_LGBBI0566.fasta
./LGBBI0589/Circularized_assembly_1_LGBBI0589.fasta
./LGBBI0554/Option_1_LGBBI0554.fasta
./LGBBI0554/Contigs_1_LGBBI0554.fasta
```
To quickly create a single fasta file containing all the fasta files, use: 
```
run_merge_fasta.sh
```
Give executable rights 
```
chmod +x run_merge_fasta.sh
```
Run merge_fasta.sh
```
./run_merge_fasta.sh
```
Now download the "merged.fasta" to your local computer. Then upload the documents to Geneious for analysis and annotation.  
```
scp jaimegm@vm-srv-astbury.vm.ntnu.no:/home/shomeb/j/jaimegm/data/bigexpansion/jaime/000_BIGTREE/Jackie_Octopus/01_NovoPlasty/merged.fasta .
```


