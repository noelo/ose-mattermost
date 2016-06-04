FROM centos:7
MAINTAINER noel.oconnor@gmail.com

RUN  yum -y install wget openssl tar && yum clean all -y
WORKDIR /opt
RUN wget -O /opt/mattermost.tar.gz https://releases.mattermost.com/3.0.3/mattermost-team-3.0.3-linux-amd64.tar.gz && tar -xvzf /opt/mattermost.tar.gz

COPY config/config.json /opt/mattermost/config

RUN mkdir -p /opt/mattermost/data
RUN useradd -r mattermost -U
RUN chown -R mattermost:mattermost /opt/mattermost
RUN chmod -R g+w /opt/mattermost

EXPOSE 8065

USER mattermost
WORKDIR /opt/mattermost/bin
ENTRYPOINT ["./platform","$*"]
