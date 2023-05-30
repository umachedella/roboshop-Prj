cp user.conf /etc/systemd/system/user.service
cp mongodb.repo /etc/yum.repos.d/mongo.repo
echo -e "\e[33m Dowloading NodeJS\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/roboshop.log
echo -e "\e[33m Installing NodeJS\e[0m"
yum install nodejs -y | bash &>>/tmp/roboshop.log | bash &>>/tmp/roboshop.log
echo -e "\e[33mUser created\e[0m"
useradd roboshop
echo -e "\e[33mCreated directory\e[0m"
mkdir /app
echo -e "\e[33m Unzip NodeJS\e[0m"
curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip | bash &>>/tmp/roboshop.log
cd /app
unzip /tmp/user.zip
echo -e "\e[33m Installing dependencies\e[0m"
npm install | bash &>>/tmp/roboshop.log
echo -e "\e[33m Systemd reload\e[0m"
echo -e "\e[3333mInstalling MongoDB\e[0m"
yum install mongodb-org-shell -y | bash &>>/tmp/roboshop.log
echo -e "\e[33mShSchema Loaded\e[0m"
mongo --host mongodb-dev.umamd.store </app/schema/user.js
systemctl daemon-reload
echo -e "\e[33mStart user\e[0m"
systemctl enable user
systemctl start user