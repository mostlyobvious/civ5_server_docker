FROM ubuntu:jammy

RUN dpkg --add-architecture i386

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update && apt-get -qq install \
  build-essential \
  curl \
  g++-multilib \
  gcc-multilib \
  git \
  libgl-dev \
  libxt6 \
  linux-libc-dev:i386 \
  openbox \
  pulseaudio \
  supervisor \
  wine \
  wine32 \
  winbind \
  x11-xkb-utils \
  xauth \
  cabextract \
&& rm -rf /var/lib/apt/lists/*

RUN curl -s -L https://sourceforge.net/projects/turbovnc/files/3.0.1/turbovnc_3.0.1_amd64.deb -o /root/turbovnc_3.0.1_amd64.deb
RUN dpkg -i /root/turbovnc_3.0.1_amd64.deb
RUN DEBIAN_FRONTEND=noninteractive apt-get install -fqqy
RUN rm /root/turbovnc_3.0.1_amd64.deb

ENV WINEARCH=win32
RUN git clone https://github.com/Winetricks/winetricks
WORKDIR /winetricks
RUN make install
WORKDIR /

RUN winetricks --force -q win10 steam

RUN git clone https://gitlab.com/torkel104/libstrangle.git
RUN cd /libstrangle && make && make install
RUN rm -rf /libstrangle

ENV DISPLAY=:1

COPY ./supervisord.conf /etc/supervisord.conf
CMD /usr/bin/supervisord -c /etc/supervisord.conf