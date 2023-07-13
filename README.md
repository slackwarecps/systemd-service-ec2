# systemd-service-ec2
Exemplo de servico do Linux para rodar aplicações springboot em uma ec2


1) faca o clone e baixe o repositorio para a pasta ~/ do ec2
2) adapte o arquivo jar dentro do workspace
3) verifique as variaveis de ambiente do arquivo your-script.sh
4) rode o arquivo install
5) habilite o servico : $ sudo systemctl enable your-application.service
6) Restart o ec2 e teste o servico

Assuming you’ve already connected to your ec2 instance. Let’s go create a service for your java application! :)

## Create a service
In your /home/ec2-user directory
```
sudo vim /etc/systemd/system/your-application.service
```
Insert the code below into your-application.service:
```

[Unit]
Description=Java Application as a Service
[Service]
User=ec2-user
#change this directory into your workspace
#mkdir workspace 
WorkingDirectory=/home/ec2-user/workspace
#path to the executable bash script which executes the jar file
ExecStart=/bin/bash /home/ec2-user/workspace/your-script.sh
SuccessExitStatus=143
TimeoutStopSec=10
Restart=on-failure
RestartSec=5
[Install]
WantedBy=multi-user.target
```
## Create a bash script to call your service
/home/ec2-user/workspace directory

sudo vim your-script.sh
The below script includes a java command to execute the .jar file which also calls the application and system properties
```
#!/bin/sh
java -Dexternal.sys.properties=file:system.properties -Dexternal.app.properties=file:application.properties -jar your-application.jar
```
Update the script permission to be executable:

Go to your bash script directory:

/home/ec2-user/workspace/ directory
```
sudo chmod u+x your-script.sh
or
sudo chmod 744 your-script.sh
```
## Start the service
```
sudo systemctl daemon-reload
sudo systemctl enable your-application.service
sudo systemctl start your-application
sudo systemctl status your-application -l
```
## Stop the service
```
sudo systemctl stop your-application
```
So that’s it. Hope it could help you! :)