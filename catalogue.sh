cp catalogue.conf /etc/systemd/system/catalogue.service
cp mongodb.repo /etc/yum.repos.d/mongo.repo

curl -sL https://rpm.nodesource.com/setup_lts.x | bash

yum install nodejs -y

useradd roboshop

mkdir /app

curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app
unzip /tmp/catalogue.zip

cd /app
npm install

systemctl daemon-reload

systemctl enable catalogue
systemctl start catalogue

mongo --host 172.31.1.123 </app/schema/catalogue.js




