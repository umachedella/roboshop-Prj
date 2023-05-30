cp mysql.conf /etc/yum.repos.d/mysql.repo
#disable MySQL 8 version
yum module disable mysql -y | bash &>>/tmp/roboshop.log
echo -e "\e[33mDownloading MySQL\e[0m"
yum install mysql-community-server -y | bash &>>/tmp/roboshop.log
echo -e "\e[33mStart MySQL.service\e[0m"
systemctl enable mysqld
systemctl start mysqld
echo -e "\e[33mSet Password\e[0m"
mysql_secure_installation --set-root-pass RoboShop@1
echo -e "\e[33mUser Created\e[0m"
mysql -uroot -pRoboShop@1
