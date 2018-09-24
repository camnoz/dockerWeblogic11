Instalacion docker

1-update ubuntu
sudo apt-get update

2-instalar aplicaciones necesarias
sudo apt-get install curl
sudo apt-get install ca-certificates
sudo apt-get install apt-transport-https
sudo apt-get install software-properties-common

3-agregar docker gpc key
sudo curl -fsSL http://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

4- verificar key
sudo apt-key fingerprint 0EBFCD88

5-instalar docker
curl -fsSL http://get.docker.com/ | sh

6-Permisos
sudo usermod -aG docker camilo

7-Reiniciar

8-Instalar Java (opcional)
sudo apt install openjdk-8-jdk

9-Descargar archivos desde github

10-Construir imagen del contenedor
docker build -t weblogic1036 /home/camilo/Escritorio/camilo/weblogic

11-Correr contenedor
docker run --name weblogic11 -d -ti -p 7001:7001 weblogic1036

12-Ingresar a la consola de weblogic.
localhost:7001/console
weblogic
weblogic01
