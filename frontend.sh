echo -e "\e33mInstalling NGNIX server\e[0m"
yum install nginx -y
echo -e "\e33mStart Ngnix server\e[0m"
systemctl enable nginx
systemctl start nginx
echo -e "\e33mRemove Files\e[0m"
rm -rf /usr/share/nginx/html/*
echo -e "\e33mDownload Content\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
echo -e "\e33mUnzip Content\e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
echo -e "\e33m Configure service\e[0m"
cp frontend.conf /etc/nginx/default.d/roboshop.conf