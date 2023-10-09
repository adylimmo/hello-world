FROM centos:latest
# RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
# RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y java
RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat
#ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.65/bin/apache-tomcat-9.0.80.tar.gz /opt/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.80/bin/apache-tomcat-9.0.80-fulldocs.tar.gz /opt/tomcat
RUN tar xvfz apache*.tar.gz
RUN mv tomcat-9.0-doc/* /opt/tomcat
#RUN mv apache-tomcat-9.0.80/* /opt/tomcat
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
