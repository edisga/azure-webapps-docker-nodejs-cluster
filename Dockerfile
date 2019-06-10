FROM node:10.14
RUN mkdir /data
WORKDIR /data
COPY package.json ./
RUN npm install
COPY . /data/

# ssh
ENV SSH_PASSWD "root:Docker!"
RUN apt-get update \
        && apt-get install -y --no-install-recommends dialog \
        && apt-get update \
	&& apt-get install -y --no-install-recommends openssh-server \
	&& echo "$SSH_PASSWD" | chpasswd 

COPY sshd_config /etc/ssh/
COPY init.sh /usr/local/bin/

EXPOSE 2222 3000
ENTRYPOINT ["/usr/local/bin/init.sh"]