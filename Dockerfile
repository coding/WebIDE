FROM ksimple/java8-mvn-nodejs-npm-python3
MAINTAINER tanhe123 from Coding IDE Team <tanhe123@coding.net>

EXPOSE 8080

# Add user `coding`

RUN useradd --create-home --home-dir /home/coding --shell /usr/bin/bash coding \
	&& echo "coding:coding" | chpasswd \
	&& adduser coding sudo \
	&& echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER coding

ADD . /opt/coding/WebIDE

RUN sudo chown -R coding /opt/coding/WebIDE

CMD ["/opt/coding/WebIDE/ide.sh", "build", "run"]
