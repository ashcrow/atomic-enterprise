#
# VIP failover monitoring container for OpenShift Origin.
#
FROM openshift/origin-base

RUN yum -y install kmod keepalived iproute psmisc nc net-tools && \
    yum clean all

ADD conf/ /var/lib/atomic-enterprise/ipfailover/keepalived/conf/
ADD lib/  /var/lib/atomic-enterprise/ipfailover/keepalived/lib/
ADD bin/  /var/lib/atomic-enterprise/ipfailover/keepalived/bin/
ADD monitor.sh /var/lib/atomic-enterprise/ipfailover/keepalived/

EXPOSE 1985
ENTRYPOINT ["/var/lib/atomic-enterprise/ipfailover/keepalived/monitor.sh"]
