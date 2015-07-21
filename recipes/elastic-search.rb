#
# Cookbook Name:: dynamic-perf
# Author: Patrick Freeman
# Recipe:: elasticsearch
#
# Copyright 2015

# dependencies
include_recipe 'dynamic-perf::dynamic'
include_recipe 'dynamic-perf::config-perf'

# vars
kv_default = "#{node['dynamic-perf']['kernel_vaule']}"
primary_default_profile = "#{node['dynamic-perf']['primary_tune_profile']}"
secondary_default_profile = "#{node['dynamic-perf']['secondary_tune_profile']}"
default_recipe = "#{node['dynamic-perf']['tune_recipe']}"


# disable numa 
# note: it is recommended that you disable
execute 'numactl-persistent' do
  command "echo 'kernel.numa_balancing = #{kv_default}' >> /etc/sysctl.d/numactl.conf"
  action :nothing
  notifies :run, 'execute[numactl-persistent]'
  not_if {File.exists?("/etc/sysctl.d/numactl.conf") }
end

# numactl
# note: it is recommended that you disable
execute 'numactl' do
  command "echo #{kv_default} > /proc/sys/kernel/numa_balancing"
  action :nothing
  notifies :run, 'execute[numactl-persistent]', :immediately
  not_if {File.exists?("/etc/sysctl.d/numactl.conf") }
end

# temp workaround 
execute 'copy' do
  command 'cp /usr/lib/tuned/throughput-performance/tuned.conf /etc/tuned/dynamic/tuned.conf'
  action :run
  not_if {File.exists?("/etc/tuned/dynamic/tuned.conf") }
end

# elasticsearch performance tuning 
bash 'node-configs' do
  user 'root'
  code <<-EOH
  echo "#elasticsearch perf profile" > /etc/tuned/dynamic/tuned.conf
  echo "[sysctl]" >> /etc/tuned/dynamic/tuned.conf
  echo "vm.nr_hugepages=#{node['dynamic-perf']['elastic_vm_nr_hugepages']}" >> /etc/tuned/dynamic/tuned.conf
  echo "vm.nr_hugepages_mempolicy=#{node['dynamic-perf']['elastic_vm_nr_hugepages_mempolicy']}" >> /etc/tuned/dynamic/tuned.conf
  echo "vm.nr_overcommit_hugepages=#{node['dynamic-perf']['elastic_vm_nr_overcommit_hugepage']}" >> /etc/tuned/dynamic/tuned.conf
  EOH
  notifies :run, 'execute[numactl]', :immediately
end

# profile to execute
execute "dynamic-tune" do
  command "tuned-adm profile #{primary_default_profile}"
  action :run
end
