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

RUN cd /opt/coding/WebIDE/frontend && npm install && npm run build \
	&& cd /opt/coding/WebIDE/frontend-webjars && mvn clean install \
	&& cd /opt/coding/WebIDE/backend && mvn clean package -Dmaven.test.skip=true \
	&& cp /opt/coding/WebIDE/backend/target/ide-backend.jar /opt/coding/WebIDE \
	&& cd /opt/coding/WebIDE/frontend && rm -r build node_modules \
	&& cd /opt/coding/WebIDE/frontend-webjars && mvn clean \
	&& cd /opt/coding/WebIDE/backend && mvn clean

CMD ["java", "-jar", "/opt/coding/WebIDE/ide-backend.jar", "--PTY_LIB_FOLDER=/opt/coding/WebIDE/backend/src/main/resources/lib"]
