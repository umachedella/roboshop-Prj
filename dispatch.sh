cp /root/roboshop-Prj/dispatch.conf /etc/systemd/system/dispatch.service
echo -e "\e[33mInstalling golang\e[0m"
yum install golang -y
echo -e "\e[33mUser crated\e[0m"
useradd roboshop
echo -e "\e[33mDirectory crated\e[0m"
mkdir /app
echo -e "\e[33mDownloading content\e[0m"
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip | bash &>>/tmp/roboshop.log
cd /app
echo -e "\e[33m Unzip file\e[0m"
unzip /tmp/dispatch.zip
echo -e "\e[33m download the dependencies & build the software\e[0m"
go mod init dispatch
go get
go build
echo -e "\e[33m Start dispatch service\e[0m"
systemctl daemon-reload
systemctl enable dispatch
systemctl restart dispatch
