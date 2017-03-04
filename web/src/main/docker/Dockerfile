FROM jboss/wildfly:latest
VOLUME /tmp # reate a temporary file on my host under "/var/lib/docker" and link it to the container under "/tmp".
ADD web-0.1.0.war /opt/jboss/wildfly/standalone/deployments/webapp.war