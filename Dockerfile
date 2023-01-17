
FROM tomcat:8.5.35-jre10
MAINTAINER ravali@gmail.com
WORKDIR /usr/local/tomcat/webapps/
RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war
EXPOSE 8080
CMD chmod +x /usr/local/tomcat/bin/catalina.sh
CMD ["catalina.sh", "run"]
