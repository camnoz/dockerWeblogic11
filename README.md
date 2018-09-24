Install docker on ubutu

1-Update ubuntu
sudo apt-get update

2-Install applications that we will need to work
sudo apt-get install curl
sudo apt-get install ca-certificates
sudo apt-get install apt-transport-https
sudo apt-get install software-properties-common

3-Add docker gpc key
sudo curl -fsSL http://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

4- Validation key
sudo apt-key fingerprint 0EBFCD88

5-Install docker
curl -fsSL http://get.docker.com/ | sh

6-Activation access to user
sudo usermod -aG docker (Your_user)

7-Restart your machine or virtual machine

8-Install Java (optional)
sudo apt install openjdk-8-jdk

9-Download files from github
https://github.com/camnoz/dockerWeblogic11.git

10-Download jdk-8u181-linux-x64.tar.gz
http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.tar.gz

11-Download wls1036_generic.jar
http://download.oracle.com/otn/nt/middleware/11g/wls/1036/wls1036_generic.jar

12-Add the files jdk and wls into scripts folder

13-Build image
docker build -t weblogic1036 /home/camilo/Escritorio/camilo/weblogic

14-Run container
docker run --name weblogic11 -d -ti -p 7001:7001 weblogic1036

15-You are ready with your weblogic.
URL:localhost:7001/console
User:weblogic
Pass:weblogic01
