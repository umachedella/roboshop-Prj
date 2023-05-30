cp payment.conf /etc/systemd/system/payment.service
echo -e "\e[33mInstalling Pythone\e[0m"
yum install python36 gcc python3-devel -y | bash &>>/tmp/roboshop.log
echo -e "\e[33mUser crated\e[0m"
useradd roboshop
echo -e "\e[33mDirectory created\e[0m"
mkdir /app
echo -e "\e[33mDownloading content\e[0m"
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip | bash &>>/tmp/roboshop.log
cd /app
unzip /tmp/payment.zip
echo -e "\e[33mStart MySQL.service\e[0m"
cd /app
pip3.6 install -r requirements.txt
echo -e "\e[33mStart Sytemd\e[0m"
systemctl daemon-reload
echo -e "\e[33mStart Payment\e[0m"
systemctl enable payment
systemctl start payment