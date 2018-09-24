FROM oraclelinux:6.8
MAINTAINER Camilo Valenzuela "infocamnmoz@gmail.com"

# USUARIOS
RUN groupadd -g 1001 weblogic && useradd -u 1001 -g weblogic weblogic
RUN mkdir -p /u01/install && mkdir -p /u01/scripts

RUN yum install -y tar

COPY scripts/install_weblogic1036.sh /u01/install/install_weblogic1036.sh
COPY scripts/template1036.jar /u01/install/template1036.jar
COPY scripts/wls1036_generic.jar /u01/install/wls1036_generic.jar
COPY scripts/jdk-8u181-linux-x64.tar.gz /u01/install/jdk-8u181-linux-x64.tar.gz
COPY scripts/create_domain.ini /u01/install/create_domain.ini
COPY scripts/start_AdminServer.sh /u01/scripts/start_AdminServer.sh
COPY scripts/start_nodemanager.sh /u01/scripts/start_nodemanager.sh
COPY scripts/start_ALL.sh /u01/scripts/start_ALL.sh
COPY scripts/create_domain.sh /u01/install/create_domain.sh
COPY scripts/create_domain.py /u01/install/create_domain.py
RUN chown -R weblogic. /u01
RUN chmod +x /u01/install/install_weblogic1036.sh
RUN chmod +x /u01/install/create_domain.sh
RUN chmod +x /u01/scripts/start_nodemanager.sh
RUN chmod +x /u01/scripts/start_AdminServer.sh
RUN chmod +x /u01/scripts/start_ALL.sh

USER weblogic

ENV USER_MEM_ARGS="-Djava.security.egd=file:/dev/./urandom"

RUN cd /u01/install && /u01/install/install_weblogic1036.sh

RUN cd /u01/install && /u01/scripts/start_AdminServer.sh && ./create_domain.sh create_domain.ini /u01/middleware1036/wlserver_10.3/server/bin/setWLSEnv.sh

RUN rm -f /u01/install/*

CMD ["/u01/scripts/start_ALL.sh"]
