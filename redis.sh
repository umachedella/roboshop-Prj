echo -e "\e[33mDownloadinging rdis\e[0m"
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y | bash &>>/tmp/roboshop.log
echo -e "\e[33mEnable redis\e[0m"
yum module enable redis:remi-6.2 -y | bash &>>/tmp/roboshop.log
echo -e "\e[33mInstalling redis\e[0m"
yum install redis -y | bash &>>/tmp/roboshop.log
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/redis.conf
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/redis/redis.conf
echo -e "\e[33mStart redis\e[0m"
systemctl enable redis
systemctl start redis