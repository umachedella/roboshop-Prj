#Configure YUM Repos from the script provided by vendor.
echo -e "\e[33m Configure YUM Repos \e[0m"
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash &>>/tmp/roboshop.log
#Configure YUM Repos for RabbitMQ.
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash &>>/tmp/roboshop.log
echo -e "\e[33m Installing RabbitMQ \e[0m"
yum install rabbitmq-server -y &>>/tmp/roboshop.log
echo -e "\e[33m Start shipping\e[0m"
systemctl enable rabbitmq-server
systemctl start rabbitmq-server
echo -e "\e[33m create one user for the application\e[0m"
rabbitmqctl add_user roboshop roboshop123
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"

