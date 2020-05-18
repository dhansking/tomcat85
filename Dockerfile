#FROM centos

LABEL Dhans dhans@dhans.org

RUN mkdir /opt/tomcat/
RUN groupadd -r tomcat && useradd -r -gtomcat tomcat

WORKDIR /opt/tomcat
RUN curl -L "https://dl.bintray.com/dhansking/dhans/apache-tomcat-8.5.55.tar.gz" -o apache-tomcat-8.5.55.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.55/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

RUN chown -R tomcat:tomcat /opt/tomcat/

WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
