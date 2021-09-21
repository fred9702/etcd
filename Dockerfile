FROM redhat/ubi8

ENV ETCD_VER v3.5.0
ENV ETCD_BIN /tmp/test-etcd
ENV GOOGLE_URL https://storage.googleapis.com/etcd
ENV GITHUB_URL https://github.com/etcd-io/etcd/releases/download
ENV DOWNLOAD_URL ${GITHUB_URL}

RUN rm -f /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz 
RUN rm -rf $ETCD_BIN 
RUN mkdir -p $ETCD_BIN

RUN dnf install -y python3

RUN curl -L ${DOWNLOAD_URL}/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz -o /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz

RUN tar xzvf /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz -C $ETCD_BIN --strip-components=1

ENTRYPOINT ${ETCD_BIN}/etcd