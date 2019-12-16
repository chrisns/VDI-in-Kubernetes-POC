FROM x11vnc/desktop
WORKDIR /opt

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
RUN apt-get update
RUN apt-get install -y \
  wget \
  code \
  chromium-browser \
  docker.io

RUN mkdir -p /home/ubuntu/Desktop &&\
  ln -s /opt/idea/bin/idea.sh /home/ubuntu/Desktop/Intellij &&\
  ln -s /usr/bin/code /home/ubuntu/Desktop/VS\ Studio\ Code &&\
  ln -s /usr/bin/firefox /home/ubuntu/Desktop/Firefox &&\
  chown -R ubuntu:ubuntu /home/ubuntu/Desktop

RUN sed -i 's/\-rfbauth.*\$DISP//g' /usr/local/bin/start_vnc
ENV SKIP_IPTABLES=1
