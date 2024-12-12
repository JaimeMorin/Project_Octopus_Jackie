#!/bin/bash

# List of config files
CONFIG_FILES=(
  "LGBBI0550/config.txt"
  "LGBBI0553/config.txt"
  "LGBBI0556/config.txt"
  "LGBBI0559/config.txt"
  "LGBBI0563/config.txt"
  "LGBBI0566/config.txt"
  "LGBBI0569/config.txt"
  "LGBBI0572/config.txt"
  "LGBBI0575/config.txt"
  "LGBBI0583/config.txt"
  "LGBBI0586/config.txt"
  "LGBBI0589/config.txt"
  "LGBBI0592/config.txt"
  "LGBBI0548/config.txt"
  "LGBBI0551/config.txt"
  "LGBBI0554/config.txt"
  "LGBBI0557/config.txt"
  "LGBBI0560/config.txt"
  "LGBBI0564/config.txt"
  "LGBBI0567/config.txt"
  "LGBBI0570/config.txt"
  "LGBBI0573/config.txt"
  "LGBBI0576/config.txt"
  "LGBBI0584/config.txt"
  "LGBBI0587/config.txt"
  "LGBBI0590/config.txt"
  "LGBBI0549/config.txt"
  "LGBBI0552/config.txt"
  "LGBBI0555/config.txt"
  "LGBBI0558/config.txt"
  "LGBBI0561/config.txt"
  "LGBBI0565/config.txt"
  "LGBBI0568/config.txt"
  "LGBBI0571/config.txt"
  "LGBBI0574/config.txt"
  "LGBBI0582/config.txt"
  "LGBBI0585/config.txt"
  "LGBBI0588/config.txt"
  "LGBBI0591/config.txt"
)

# Run NOVOPlasty for each config file
for CONFIG in "${CONFIG_FILES[@]}"; do
  echo "Running NOVOPlasty for $CONFIG..."
  NOVOPlasty4.3.5.pl -c "$CONFIG"
  if [ $? -ne 0 ]; then
    echo "Error running NOVOPlasty for $CONFIG. Exiting."
    exit 1
  fi
  echo "Completed $CONFIG"
done

echo "All configurations processed successfully!"

