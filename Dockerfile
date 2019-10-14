FROM node:10.16-stretch
MAINTAINER ryanhs <ryan.hamonangansilalahi@ai.astra.co.id>

# prerequisite
RUN apt update

# pm2
RUN npm i -g pm2

# libreoffice
WORKDIR /tmp
RUN apt install -y libxinerama1 libfontconfig1 libdbus-glib-1-2 libcairo2 libcups2 libglu1-mesa libsm6 default-jre
RUN wget https://downloadarchive.documentfoundation.org/libreoffice/old/5.3.2.2/deb/x86_64/LibreOffice_5.3.2.2_Linux_x86-64_deb.tar.gz \
    && tar -zxvf LibreOffice_5.3.2.2_Linux_x86-64_deb.tar.gz
WORKDIR /tmp/LibreOffice_5.3.2.2_Linux_x86-64_deb/DEBS
RUN dpkg -i *.deb
