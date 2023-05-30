cp payment.conf /etc/systemd/system/payment.service
echo -e "\e[33mInstalling Python\e[0m"
yum install python36 gcc python3-devel -y | bash &>>/tmp/roboshop.log
echo -e "\e[33mUser crated\e[0m"
useradd roboshop
echo -e "\e[33mDirectory created\e[0m"
mkdir /app
echo -e "\e[33mDownload the application code to created app directory\e[0m"
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip | bash &>>/tmp/roboshop.log
cd /app
unzip /tmp/payment.zip
echo -e "\e[33m Download the dependencies\e[0m"
pip3.6 install -r requirements.txt | bash &>>/tmp/roboshop.log
echo -e "\e[33m Reload Sytemd\e[0m"
systemctl daemon-reload
echo -e "\e[33mStart Payment Service\e[0m"
systemctl enable payment
systemctl start payment