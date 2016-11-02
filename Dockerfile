FROM ksimple/java8-mvn-nodejs-npm-python3
MAINTAINER tanhe123 from Coding IDE Team <tanhe123@coding.net>

EXPOSE 8080

RUN apt-get update && apt-get install -y zsh && apt-get clean && rm -rf /var/lib/apt/lists/*

# Add user `coding`
RUN useradd --create-home --home-dir /home/coding --shell /usr/bin/zsh coding \
	&& echo "coding:coding" | chpasswd \
	&& adduser coding sudo \
	&& echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers 

USER coding
ENV HOME /home/coding
ENV SHELL /usr/bin/zsh
ENV TERM xterm
ADD . /opt/coding/WebIDE

# Install oh-my-zsh
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh \
	&& cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

RUN sudo chown -R coding /opt/coding/WebIDE \
    && mkdir $HOME/.m2

RUN cd /opt/coding/WebIDE/frontend && npm install && npm run build \
	&& cd /opt/coding/WebIDE/frontend-webjars && mvn clean install \
	&& cd /opt/coding/WebIDE/backend && mvn clean package -Dmaven.test.skip=true \
	&& cp /opt/coding/WebIDE/backend/target/ide-backend.jar /opt/coding/WebIDE \
	&& cd /opt/coding/WebIDE/frontend && rm -r build node_modules \
	&& cd /opt/coding/WebIDE/frontend-webjars && mvn clean \
	&& cd /opt/coding/WebIDE/backend && mvn clean \
	&& rm -fr $HOME/.m2

ENV CODING_IDE_HOME /home/coding/coding-ide-home
CMD ["java", "-jar", "/opt/coding/WebIDE/ide-backend.jar", "--PTY_LIB_FOLDER=/opt/coding/WebIDE/backend/src/main/resources/lib"]
