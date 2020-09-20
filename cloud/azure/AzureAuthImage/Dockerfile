FROM ubuntu
ENV ClientId="xxxxxx"
ENV ClientSecret="xxxxx"
ENV tenantId="xxxxxx"
ENV ReleaseName=bionic
RUN apt update
RUN apt-get install ca-certificates curl apt-transport-https lsb-release gnupg -y
RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor |  tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ ${ReleaseName} main" |  tee /etc/apt/sources.list.d/azure-cli.list
RUN apt update && apt install -y azure-cli
RUN apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN adduser --disabled-password --gecos '' azure
USER azure
COPY --chown=azure jino.sh /home/azure/loginInit.sh
RUN chmod +x /home/azure/loginInit.sh
CMD ["/home/azure/loginInit.sh"]