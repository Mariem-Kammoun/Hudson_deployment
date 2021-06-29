FROM ubuntu:20.04

MAINTAINER MK

#Install Java 8
RUN apt-get update &&\
    apt-get install -y openjdk-8-jdk

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

#Install Tomcat
RUN mkdir /usr/local/tomcat
RUN apt-get install -y wget
RUN wget https://downloads.apache.org/tomcat/tomcat-8/v8.5.68/bin/apache-tomcat-8.5.68.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-8.5.68/* /usr/local/tomcat/
CMD /usr/local/tomcat/bin/catalina.sh run

#Deploy Hudson
COPY hudson-war-3.3.3.war /usr/local/tomcat/webapps/

#Hudson plugins
COPY hudson-plugins/*.hpi /root/.hudson/plugins/

EXPOSE 8080