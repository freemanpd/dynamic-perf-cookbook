#
# Cookbook Name:: dynamic-perf
# Author: Patrick Freeman
# Recipe:: haproxt
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


# disable numa
execute 'numactl-persistent' do
  command "echo 'kernel.numa_balancing = #{kv_default}' >> /etc/sysctl.d/numactl.conf"
  action :nothing
  notifies :run, 'execute[numactl-persistent]'
  not_if {File.exists?("/etc/sysctl.d/numactl.conf") }
end

# numactl
execute 'numactl' do
  command "echo #{kv_default} > /proc/sys/kernel/numa_balancing"
  action :nothing
  notifies :run, 'execute[numactl-persistent]', :immediately
  not_if {File.exists?("/etc/sysctl.d/numactl.conf") }
end

# profile to execute
execute "dynamic-tune" do
  command "tuned-adm profile #{primary_default_profile}"
  action :run
  notifies :run, 'execute[numactl]'
end
