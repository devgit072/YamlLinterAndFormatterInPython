#!/bin/bash

function formatAYamlFile() {
       fileInput=$1
       if [[ $fileInput != *.yaml ]] && [[ $fileInput != *.yml ]]; then
               echo "$fileInput is not a yaml file"
               exit 0
       fi
       #echo "$fileInput is a yaml file. Running yamllint on it"
       #echo "First running yamllint to find any possible duplicate keys"
       yamllint -c yamllint_syntax_check_only.config $fileInput
       if [ $? != 0 ]; then
         echo "$fileInput has duplicate keys which makes the yaml file invalid. We dont know which keys to remove, so \
please resolve the duplicate keys \
and then retry"
         exit 1
       fi
       ## Combine one or more empty lines into one
       sed -i 'N;/^\n$/D;P;D;' $fileInput

       ## Delete the leading blank lines
       sed -i '/./,$!d' $fileInput
       ## Delete the trailing blank lines
       sed -i ':a;/^[ \n]*$/{$d;N;ba}' $fileInput
       python3 formatYamlFile.py $fileInput
       tmpFile='/tmp/tmp.yaml'
       cat $tmpFile > $fileInput
}

input=$1
export -f formatAYamlFile
#echo "Input $input"
if [[ -d $input ]]; then
        #echo "$input is a directory"
        #echo "Fetching all file inside directory: $input and running yamllint on it."
        for i in $(find $input -name "*.yaml"); do
                formatAYamlFile $i
        done
        for i in $(find $input -name "*.yml"); do
                formatAYamlFile $i
        done
elif [[ -f $input ]]; then
  formatAYamlFile $input
else
  echo "$input doesn't exist"
fi

