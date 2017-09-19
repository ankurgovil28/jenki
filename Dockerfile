FROM maven:latest as build
WORKDIR /opt/demo
COPY . /opt/demo
ENV http_proxy http://proxy.esl.cisco.com:80
ENV https_proxy http://proxy.esl.cisco.com:80
RUN mvn package 

FROM tomcat
WORKDIR /usr/local/tomcat
COPY --from=build /opt/demo/target/*.war webapps
CMD catalina.sh run 

