#
# Cookbook Name:: dynamic-perf
# Author: Patrick Freeman
# Recipe:: os-perf
#
# Copyright 2015

# os perf

# vars. loads all external variables from a single location
# require_relative 'vars'
kv_default = "#{node[:'dynamic-perf'][:kernel_vaule]}"
default_profile = "#{node[:'dynamic-perf'][:tune_profile]}"
default_recipe = "#{node[:'dynamic-perf'][:default_tune_recipe]}"
# dynamic profiles
# include_recipe 'dynamic-perf::#{default_tune_recipe}'

# numa persistent
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

%w{tuned numactl numactl-devel irqbalance sysstat}.each do |pak|
  package "#{pak}" do
    action :install
    notifies :run, 'execute[numactl]', :immediately
  end
end

# tuned
service 'tuned' do
  supports :status => true, :restart => true, :reload => true
  action [:start, :enable]
end

# systat
service 'sysstat' do
  supports :status => true, :restart => true, :reload => true
  action [:start, :enable]
end

# irq balance
service 'irqbalance' do
  supports :status => true, :restart => true, :reload => true
  action [:stop, :disable]
end

