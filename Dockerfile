#
# This is the unofficial Atomic Enterprise image for the DockerHub. It has as its
# entrypoint the Atomic Enterprise all-in-one binary.
#
# See images/origin for the official release version of this image
FROM openshift/origin-base

RUN yum install -y golang && yum clean all

WORKDIR /go/src/github.com/projectatomic/atomic-enterprise
ADD .   /go/src/github.com/projectatomic/atomic-enterprise
ENV GOPATH /go
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin

RUN go get github.com/projectatomic/atomic-enterprise && \
    hack/build-go.sh && \
    cp _output/local/go/bin/* /usr/bin/ && \
    mkdir -p /var/lib/atomic-enterprise

EXPOSE 8080 8443
WORKDIR /var/lib/atomic-enterprise
ENTRYPOINT ["/usr/bin/atomic-enterprise"]
