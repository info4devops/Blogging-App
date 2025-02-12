!#/bin/bash

# install java 
sudo apt install openjdk-17-jre-headless -y 

#Install jenkins 
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins -y

# install docker
sudo apt  install docker.io  -y

sudo chmod 666 /var/run/docker.sock


Sonar token
squ_9f80a5001116d350d6bdab76f64d52c9f1ce090b


k8s token

eyJhbGciOiJSUzI1NiIsImtpZCI6IkxWNUxEUGpvOTBuRDhjOHFQOHhKaXExLTJEelNSeXdvbFJqZEZMWVlFMGcifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJ3ZWJhcHBzIiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZWNyZXQubmFtZSI6Im15c2VjcmV0bmFtZSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50Lm5hbWUiOiJqZW5raW5zIiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZXJ2aWNlLWFjY291bnQudWlkIjoiMDIyMTcxZmQtY2NiZS00YmI5LTg3NjctZTliZmEwNDIwMjYyIiwic3ViIjoic3lzdGVtOnNlcnZpY2VhY2NvdW50OndlYmFwcHM6amVua2lucyJ9.Bmi3pJJg6yHUOI5hLfWpNrY9t3kuRR1FriN9NQdwgjm4SLnCSI2Gh3T1wCUDLb37Vuh1b__I9_iLeEagh1vZCOz4rTE8MpjMvTJCzRUpSA_TXDlJlPG2pZsA1ltch8VWLICIYAV3AItNTvIWjNfqDH-fZnnrH0CklpBQ9sfS7EL3qkrnAYGUKCdf6zsUUBT6-8JxCcYG8PVn_8TSbekRQC6lykqXl5WUwrmyWzi6k4B24J7vZC2hH2_uCef8OUfiVM6pNQx74oikH4cSUS2-ZZnjKY0eUMCqEddgVhzdwRfN7EsstXXrAwWCr3YUzDMtUg8ktPcZGkewXIDoqWDwmg