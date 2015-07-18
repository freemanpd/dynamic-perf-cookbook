#
# Cookbook Name:: dynamic-perf
# Author: Patrick Freeman
# Recipe:: node
#
# Copyright 2015

# node.JS
# kernel
http.globalAgent.maxSocket=1000


# limits
/etc/security/limits.d/node.conf

*	soft	nofile	999999
*	hard	nofile	999999

# ports 18000 to 65535


#
net.ipv4.ip_local_port_range = 18000    65535
net.ipv4.netfilter.ip_conntrack_tcp_timeout_time_wait = 1


# speed up
net.netfilter.nf_conntrack_tcp_timeout_established=600