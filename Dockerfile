FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd -y
RUN yum install net-tools -y
COPY  .   /var/www/html/
COPY  /home/   /
COPY  ./cgi-bin/   /var/www/cgi-bin/
RUN chmod +x /var/www/cgi-bin/app.py
RUN chmod +x /var/www/cgi-bin/app1.py
RUN /usr/sbin/httpd 
CMD ["/usr/sbin/httpd" , "-D" , "FOREGROUND"]
# FROM vimal13/apache-webserver-php


# COPY index.html /var/www/html/
