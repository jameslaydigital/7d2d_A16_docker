FROM ubuntu
RUN apt -y update && apt -y upgrade && apt -y install vim wget lib32gcc1 
RUN addgroup steam && adduser --home /home/steam --shell /bin/bash --ingroup steam --gecos GECOS steam
WORKDIR /home/steam
RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && tar -xzf steamcmd_linux.tar.gz
RUN mkdir 7dtd && chown steam:steam 7dtd
RUN ./steamcmd.sh +login anonymous +force_install_dir /home/steam/7dtd +app_update 294420 +quit
WORKDIR /home/steam/7dtd
