#Configure YUM Repos from the script provided by vendor.
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash &>>/tmp/roboshop.log
#Configure YUM Repos for RabbitMQ.
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash &>>/tmp/roboshop.log

yum install rabbitmq-server -y &>>/tmp/roboshop.log

systemctl enable rabbitmq-server
systemctl start rabbitmq-server

rabbitmqctl add_user roboshop roboshop123
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"

