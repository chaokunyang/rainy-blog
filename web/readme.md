1、docker-compose up -d

chaokunyang/nginx:This image creates a /tmp/cache directory in the
NGINX container filesystem

2、Build the Java application and package it as a WAR file   
gradle :web:build

3、Copy the WAR file in the WildFly container    
docker cp build/libs/web-0.1.0.war caching_web_1:/opt/jboss/wildfly/standalone/deployments/webapp.war
  
4、Update the NGINX configuration file using the IP regular
  expression:       
  sed -i -e "s/IP/`docker inspect  --format='{{range .NetworkSettings.Networks}} {{.IPAddress}}{{end}}' caching_web_1`/g" conf/nginx.conf

5、Copy the NGINX configuration file to the container: 

docker cp conf/nginx.conf caching_lb_1:/etc/nginx/nginx.conf

6、Reload the NGINX Docker container configuration with 

docker  exec -it caching_lb_1 nginx -s reload

7、Use the command curl -I http://localhost:8080/webapp/index.html to get the response headers for index.html in the
  web application.
 
 The output of this command looks like this:
    HTTP/1.1 200 OK
    Server: nginx/1.11.8
    Date: Sat, 04 Mar 2017 08:38:58 GMT
    Content-Type: text/html
    Content-Length: 148
    Connection: keep-alive
    Last-Modified: Sun, 11 Sep 2016 00:57:02 GMT
    X-Powered-By: Undertow/1
    X-Cache-Status: MISS
    Accept-Ranges: bytes
   
8、
Accessing the HTML document again using the curl -I
http://localhost:8080/webapp/index.html command shows
similar output. The only difference is that the value of X-Cache-
Status is now HIT. This value indicates that the response contains
valid, fresh content direct from the cache.

9、
Use the command curl -I http://localhost:8080/webapp/
index.jsp to get the response headers for index.jsp in the web
application. The set of headers is very similar to the first request
for index.html. The only difference is the Set-Cookie header,
which is included because this is a JSP page.
    HTTP/1.1 200 OK
    Server: nginx/1.11.8
    Date: Sat, 04 Mar 2017 08:43:42 GMT
    Content-Type: text/html;charset=ISO-8859-1
    Content-Length: 200
    Connection: keep-alive
    X-Powered-By: Undertow/1
    X-Powered-By: JSP/2.3
    Set-Cookie: JSESSIONID=RJeqxqCHDlh91pHdXgInptaZkDUBoGDXSz13evSz.c45e627cf0f2; path=/webapp
    X-Cache-Status: MISS

10、Any subsequent requests for index.jsp continue to show the
response header X-Cache-Status: MISS. This is because any
response with the Set-Cookie header is not cached by NGINX.

11、



