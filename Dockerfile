FROM tomcat:8.0-alpine
LABEL maintainer="samridhi9719"
COPY tomcat-users.xml /usr/local/tomcat/conf
COPY sample.war /usr/local/tomcat/webapps/
COPY context.xml /usr/local/tomcat/webapps/manager/META-INF
EXPOSE 8080
CMD ["catalina.sh", "run"]
