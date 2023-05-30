cp shipping.conf /etc/systemd/system/shipping.service
echo -e "\e[333333mInstalling NodeJS\e[0m"
yum install maven -y | bash &>>/tmp/roboshop.log
echo -e "\e[33mUser created\e[0m"
useradd roboshop
echo -e "\e[33mCreated directory\e[0m"
mkdir /app
echo -e "\e[33m Unzip File\e[0m"
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip | bash &>>/tmp/roboshop.log
cd /app
unzip /tmp/shipping.zip
cd /app
mvn clean package
mv target/shipping-1.0.jar shipping.jar
echo -e "\e[33m Systemd reload\e[0m"
systemctl daemon-reload
echo -e "\e[33m Start shipping\e[0m"
systemctl enable shipping
systemctl start shipping
echo -e "\e[33mInstalling mysql\e[0m"
yum install mysql -y | bash &>>/tmp/roboshop.log
echo -e "\e[33m user created mysql\e[0m"
mysql -h mysql-dev.umamd.store -uroot -pRoboShop@1 < /app/schema/shipping.sql