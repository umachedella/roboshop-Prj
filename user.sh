cp user.conf /etc/systemd/system/user.service
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/roboshop.log
echo -e "\e[33mInstallong NodeJS\e[0m"
yum install nodejs -y | bash &>>/tmp/roboshop.log
echo -e "\e[33mUser created\e[0m"
useradd roboshop
echo -e "\e[33mCreated directory\e[0m"
mkdir /app
echo -e "\e[33m Unzip NodeJS\e[0m"
curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
cd /app
unzip /tmp/user.zip
echo -e "\e[33m Installing dependencies.\e[0m"
cd /app
npm install
echo -e "\e[33m Installing dependencies.\e[0m"
