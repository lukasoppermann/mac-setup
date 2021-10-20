#!/bin/bash

echo -e "\n# load the setup file which in turn loads all customisations for bash" >> $HOME/.bash_profile
echo "setupDir=$(dirname "$0")" >> $HOME/.bash_profile
echo "source \$setupDir/.setup_bash" >> $HOME/.bash_profile
