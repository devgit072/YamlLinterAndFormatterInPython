import sys
from ruamel.yaml import YAML

# Run this using python3 formatYamlFile.py $fileInput
yaml = YAML()
yaml.explicit_start = True

yaml.indent(mapping=2, sequence=4, offset=2) # Keep the indentation of 2.
yaml.preserve_quotes = True  # To preserve the comments and blank lines.

yamlFile=(sys.argv[1])
#print ('Formatting yaml file: ', yamlFile)
with open(yamlFile) as fp:
    data = yaml.load(fp)

# Dump the formatted output in the stdout console.
yaml.dump(data, sys.stdout)

# Write in some temporary file. Dont overwrite the original yaml file.
with open('/tmp/tmp.yaml', 'w') as outputFile:
    yaml.dump(data, outputFile)

