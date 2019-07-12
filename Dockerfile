FROM debian:stretch-slim

ENV BLTG_VERSION=3.0.0
ENV BLTG_USER=bltg
ENV BLTG_URL=https://www.dropbox.com/s/m0flm1tfiyzpcvo/bltg-3.0.0-x86_64-linux-gnu.tar.gz?dl=0
ENV BLTG_CONF=/home/$BLTG_USER/.bltg/bltg.conf

RUN apt-get -qq update && \
apt-get install -yq wget ca-certificates pwgen && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
wget $BLTG_URL -O /tmp/bltg.tar.gz && \
mkdir -p /opt && \
cd /opt && \
tar xvzf /tmp/bltg.tar.gz && \
rm /tmp/bltg.tar.gz && \
ln -sf bltg-$BLTG_VERSION bltg && \
ln -sf /opt/bltg/bin/bltgd /usr/local/bin/bltgd && \
ln -sf /opt/bltg/bin/bltg-cli /usr/local/bin/bltg-cli && \
ln -sf /opt/bltg/bin/bltg-tx /usr/local/bin/bltg-tx && \
adduser --uid 1000 --system ${BLTG_USER} && \
mkdir -p /home/${BLTG_USER}/.bltg/ && \
chown -R ${BLTG_USER} /home/${BLTG_USER} && \
echo "success: $BLTG_CONF"

USER bltg
RUN echo "rpcuser=bltg" > ${BLTG_CONF} && \
        echo "rpcpassword=`pwgen 32 1`" >> ${BLTG_CONF} && \
        echo "Success"

EXPOSE 17127
VOLUME ["/home/bltg/.bltg"]
WORKDIR /home/bltg

ENTRYPOINT ["/usr/local/bin/bltgd"]
