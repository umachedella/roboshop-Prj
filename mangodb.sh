echo -e "\e[33mInstalling MangoDB repo\e[0m"
cp mongodb.repo /etc/yum.repos.d/mongo.repo
echo -e "\e[33mInstalling MangoD B server\e[0m"
yum install mongodb-org -y
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
##Update listen address from 127.0.0.1 to 0.0.0.0 in /etc/mongod.conf
echo -e "\e[33mStart MangoDB\e[0m"
systemctl enable mongod
systemctl restart mongod
