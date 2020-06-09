Make sure python3 is installed. In Ubuntu-18, python3 is already pre-installed.

Install all the necessary libraries

Install pip3
===================================
sudo apt-get -y install python3-pip

pip3 --version (to check the installation and version)

Install yamllint
===================================
sudo apt-get install yamllint


sudo apt-get may install old version of yamllint, so better way is to install through pip which will install latest yamllint

pip3 install --user yamllint

Important: yamllint is installed in ~/.local/bin. So dont forget to include that in PATH

export PATH=$PATH:~/.local/bin

You can follow the documentation of yamllint: https://yamllint.readthedocs.io/en/stable/quickstart.html

Install ruamel library
===================================
pip3 install -U pip setuptools wheel

pip3 install ruamel.yaml

Awesome!. Now you are all done. You can use yamllint which will test if yaml if valid or not. You use ruamel to format the yaml file. ruamel preserves the comment, which makes it a better alternative for yaml formatting in python world.


How to run yammlint
===============================
If yamllint is installed properly, then just run below command:
yamllint test.yaml

It will pick default yamllint.config. You can also create your own custom yamllint config file and choose which error to disable or enable.

When you run yammlint, you will get output like this:	
1:26      warning  missing starting space in comment  (comments)
  3:81      error    line too long (93 > 80 characters)  (line-length)
  7:1       warning  missing document start "---"  (document-start)
  60:81     error    line too long (103 > 80 characters)  (line-length)
  63:81     error    line too long (105 > 80 characters)  (line-length)
  64:81     error    line too long (90 > 80 characters)  (line-length)
  68:81     error    line too long (89 > 80 characters)  (line-length)
  91:81     error    line too long (103 > 80 characters)  (line-length)
  94:81     error    line too long (105 > 80 characters)  (line-length)
  95:81     error    line too long (90 > 80 characters)  (line-length)
  98:81     error    line too long (89 > 80 characters)  (line-length)
  101:1     error    too many blank lines (1 > 0)  (empty-lines)


To run with custom yammlint config file, run:
yamllint -c mycustom.config yamlfile.yaml



