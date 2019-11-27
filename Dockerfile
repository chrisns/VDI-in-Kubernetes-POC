FROM x11vnc/desktop
WORKDIR /opt

ARG INTELJ_VERSION=2019.2.4
ARG INTELJ_VERSION_INTERNAL=192.7142.36

RUN curl -s https://download-cf.jetbrains.com/idea/ideaIC-${INTELJ_VERSION}.tar.gz | tar -xz -C /opt
RUN mv /opt/idea-IC-${INTELJ_VERSION_INTERNAL} /opt/idea

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

# RUN usermod -aG docker ubuntu
RUN sed -i 's/\-rfbauth.*\$DISP//g' /usr/local/bin/start_vnc
ENV SKIP_IPTABLES=1
# FROM dorowu/ubuntu-desktop-lxde-vnc
# WORKDIR /opt

# ARG INTELJ_VERSION=2019.2.4
# ARG INTELJ_VERSION_INTERNAL=192.7142.36

# RUN curl -s https://download-cf.jetbrains.com/idea/ideaIC-${INTELJ_VERSION}.tar.gz | tar -xz -C /opt
# RUN mv /opt/idea-IC-${INTELJ_VERSION_INTERNAL} /opt/idea

# RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
# RUN add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
# RUN apt-get update
# RUN apt-get install -y \
#   wget \
#   code \
#   chromium-browser \
#   docker.io

# RUN ln -s /opt/idea/bin/idea.sh /home/ubuntu/Desktop/Intellij
# RUN ln -s /usr/bin/code /home/ubuntu/Desktop/VS\ Studio\ Code
# RUN ln -s /usr/bin/firefox /home/ubuntu/Desktop/Firefox