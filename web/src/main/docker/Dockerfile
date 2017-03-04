FROM jboss/wildfly:latest
VOLUME /tmp # reate a temporary file on my host under "/var/lib/docker" and link it to the container under "/tmp".
COPY build/libs/web-0.1.0.war /opt/jboss/wildfly/standalone/deployments/webapp.war
RUN sh -c "touch /opt/jboss/wildfly/standalone/deployments/webapp.war" #  "touch" the jar file so that it has a file modification time (Docker creates all container files in an "unmodified" state by default). This actually isn’t important for the simple app that we wrote, but any static content (e.g. "index.html") would require the file to have a modification time.
