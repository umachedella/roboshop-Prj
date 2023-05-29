cp catalogue.conf /etc/systemd/system/catalogue.service
cp mongodb.repo /etc/yum.repos.d/mongo.repo
echo -e "\e[33mDownload NodJS\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo -e "\e[33mInstalling NodeJS\e[0m"
yum install nodejs -y
echo -e "\e[33m User roboshop added\e[0m"
useradd roboshop
echo -e "\e[33mCreated directory app\e[0m"
mkdir /app
echo -e "\e[33mDownloaded catalouge\e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
echo -e "\e[33mUnzip File\e[0m"
cd /app
unzip /tmp/catalogue.zip
echo -e "\e[33mInstalling NPM\e[0m"
cd /app
npm install
echo -e "\e[Reload daemon service\e[0m"
systemctl daemon-reload
echo -e "\e[33mStart Catalouge\e[0m"
systemctl enable catalogue
systemctl start catalogue
echo -e "\e[33mShSchema Loaded\e[0m"
mongo --host 172.31.1.123 </app/schema/catalogue.js




