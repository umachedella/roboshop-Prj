cp cart.conf /etc/systemd/system/cart.service
echo -e "\e[33mDownloading NodeJS\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/roboshop.log
echo -e "\e[33mInstalling NodeJS\e[0m"
yum install nodejs -y | bash &>>/tmp/roboshop.log
echo -e "\e[33mUser created\e[0m"
useradd roboshop
echo -e "\e[33mCreated directory\e[0m"
mkdir /app
echo -e "\e[33m Unzip File\e[0m"
curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip
cd /app
unzip /tmp/cart.zip
cd /app
echo -e "\e[33m Installing Dependencies\e[0m"
npm install | bash &>>/tmp/roboshop.log
echo -e "\e[33m Systemd reload\e[0m"
systemctl daemon-reload
echo -e "\e[33m Start user\e[0m"
systemctl enable cart
systemctl start cart
