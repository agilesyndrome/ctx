#!/bin/zsh
echo "Copying /home/_template to the local Docker volume"
cp -r /home/_template/. /mnttmp
echo "Complete"
