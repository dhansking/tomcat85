FROM centos

LABEL Dhans dhans@dhans.org

RUN groupadd -r tomcat && useradd -r -g tomcat tomcat
RUN mkdir /opt/tomcat

WORKDIR /opt/tomcat
RUN curl -O -L https://dl.bintray.com/dhansking/dhans/apache-tomcat-8.5.55.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.55/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

RUN chown -R tomcat:tomcat /opt/tomcat/

WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war

RUN chown -R tomcat:tomcat /opt/tomcat/
EXPOSE 8080

ENTRYPOINT ["/opt/tomcat/bin/catalina.sh"]
CMD ["run"]
