FROM ubuntu:latest

ARG asdfVersion=v0.10.0
ARG zshDockerVersion=v1.1.2
ARG appUser=appbot

ENV CTX_USER=${appUser}


RUN apt-get update \
 && apt-get install -y \
	curl \
	git \
	gpg \
	jq \
	sudo \
	unzip \
	wget \
 && mkdir -p /cache /tools/asdf \
 && mkdir -p /home/${appUser} \
 && useradd -m -d /home/_template ${appUser} \
 && chown -R ${appUser}:${appUser} /tools \
 && chown -R ${appUser}:${appUser} /home/${appUser} \
 && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
 && unzip awscliv2.zip \
 && ./aws/install \
 && rm -f awscliv2.zip \
 && echo "${appUser} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER ${appUser}
WORKDIR /home/_template

ARG ctxDefaultTheme=robbyrussell

RUN git clone https://github.com/asdf-vm/asdf.git /tools/asdf --branch ${asdfVersion} \
 && sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- \
    -t ${ctxDefaultTheme}

COPY bin /bin
COPY asdf /etc/asdf
COPY home /tmp/home

RUN cat /tmp/home/.zshrc >> /home/_template/.zshrc \
 && sed 's#/home/_template#${HOME}#g' -i /home/_template/.zshrc \
 && cp /home/_template/.zshrc /home/${appUser}/.zshrc \
 && cp -r /etc/asdf/. /home/_template \
 && ls -lah /home/_template \
 && cat /home/_template/.zshrc \
 && sudo usermod -d /home/${appUser} ${appUser}

WORKDIR /workspace
ENV CTX_TYPE=docker
ENV CTX_TYPEICON=🐳

ENTRYPOINT [ "entrypoint.sh" ]
