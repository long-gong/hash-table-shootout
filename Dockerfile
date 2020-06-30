FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y git sudo apt-utils software-properties-common wget autoconf

RUN apt-get install nginx -y

RUN cd /tmp && \
    git clone https://github.com/long-gong/hash-table-shootout.git && \
    cd hash-table-shootout && \
    chmod +x ./before_install.sh && \
    ./before_install.sh && \
    make && \
    export LC_ALL=C.UTF-8 && \
    export LANG=C.UTF-8 && \
    make html && \
    mv index.html /var/www/html/ \
    mv *.js /var/www/html/

EXPOSE 80

CMD ["nginx","-g","daemon off;"]