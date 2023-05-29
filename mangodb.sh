echo -e "\e33mInstalling MangoDB repo\e[0m"
cp mangofb.repo /etc/yum.repos.d/mongo.repo
echo -e "\e33mInstalling MangoD B server\e[0m"
yum install mongodb-org -y
##Update listen address from 127.0.0.1 to 0.0.0.0 in /etc/mongod.conf
echo -e "\start MangoDB server\e[0m"
systemctl enable mongod
systemctl restart mongod