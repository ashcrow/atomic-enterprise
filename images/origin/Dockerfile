#
# This is the official OpenShift Origin image. It has as its entrypoint the OpenShift
# all-in-one binary.
#
FROM openshift/origin-base

RUN mkdir -p /var/lib/atomic-enterprise

ADD bin/atomic-enterprise /usr/bin/atomic-enterprise
RUN ln -s /usr/bin/atomic-enterprise /usr/bin/oc && \
    ln -s /usr/bin/atomic-enterprise /usr/bin/oadm && \
    ln -s /usr/bin/atomic-enterprise /usr/bin/osc && \
    ln -s /usr/bin/atomic-enterprise /usr/bin/osadm && \
    ln -s /usr/bin/atomic-enterprise /usr/bin/kubectl && \
    ln -s /usr/bin/atomic-enterprise /usr/bin/atomic-enterprise-deploy && \
    ln -s /usr/bin/atomic-enterprise /usr/bin/atomic-enterprise-docker-build && \
    ln -s /usr/bin/atomic-enterprise /usr/bin/atomic-enterprise-sti-build && \
    ln -s /usr/bin/atomic-enterprise /usr/bin/atomic-enterprise-router

ADD scripts/recycler.sh /usr/share/openshift/scripts/volumes/recycler.sh

ENV HOME /root
ENV OPENSHIFT_CONTAINERIZED true
ENV KUBECONFIG /var/lib/atomic-enterprise/openshift.local.config/master/admin.kubeconfig
WORKDIR /var/lib/atomic-enterprise
ENTRYPOINT ["/usr/bin/atomic-enterprise"]
