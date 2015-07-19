#
# Cookbook Name:: dynamic-perf
# Author: Patrick Freeman
# Recipe:: node
#
# Copyright 2015

# dependencies
include_recipe 'dynamic-perf::dynamic'
include_recipe 'dynamic-perf::config-perf'

# vars
kv_default = "#{node[:'dynamic-perf'][:kernel_vaule]}"
primary_default_profile = "#{node[:'dynamic-perf'][:primary_tune_profile]}"
secondary_default_profile = "#{node[:'dynamic-perf'][:secondary_tune_profile]}"
default_recipe = "#{node[:'dynamic-perf'][:tune_recipe]}"

# sshd service
service 'sshd' do
  supports :status => true, :restart => true, :reload => true
  action :nothing
end

# limits
bash 'sec-limits' do
  user 'root'
  code <<-EOH
  echo "*	soft	nofile	999999" > /etc/security/limits.d/node.conf
  echo "*	hard	nofile	999999" >> /etc/security/limits.d/node.conf
  EOH
  notifies :restart, 'service[sshd]', :immediately
end

# temp workaround 
execute 'copy' do
  command 'cp /usr/lib/tuned/throughput-performance/tuned.conf /etc/tuned/dynamic/tuned.conf'
  action :run
  not_if {File.exists?("/etc/tuned/dynamic/tuned.conf") }
end

# node.JS performance tuning 
bash 'node-configs' do
  user 'root'
  code <<-EOH
  echo "[sysctl]" > /etc/tuned/dynamic/tuned.conf
  echo "net.ipv4.ip_local_port_range=#{node[:'dynamic-perf'][:node_net_ipv4_ip_local_port_range]}" >> /etc/tuned/dynamic/tuned.conf
  echo "net.netfilter.nf_conntrack_tcp_timeout_established=#{node[:'dynamic-perf'][:node_net_netfilter_nf_conntrack_tcp_timeout_established]}" >> /etc/tuned/dynamic/tuned.conf
  EOH
end

#  echo "http.globalAgent.maxSocket=#{node[:'dynamic-perf'][:node_http_globalAgent_maxSocket]}" > /etc/tuned/dynamic/tuned.conf
#   echo "net.ipv4.netfilter.ip_conntrack_tcp_timeout_time_wait=#{node[:'dynamic-perf'][:node_net_ipv4_netfilter_ip_conntrack_tcp_timeout_time_wait]}" >> /etc/tuned/dynamic/tuned.conf


# profile to execute
execute "dynamic-tune" do
  command "tuned-adm profile #{primary_default_profile}"
  action :run
end


