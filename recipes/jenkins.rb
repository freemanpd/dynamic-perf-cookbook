#
# Cookbook Name:: dynamic-perf
# Author: Patrick Freeman
# Recipe:: jenkins
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

# override network latenecy profile
execute 'copy' do
  command 'cp /usr/lib/tuned/network-latency/tuned.conf /etc/tuned/dynamic/tuned.conf'
  action :run
  not_if {File.exists?("/etc/tuned/dynamic/tuned.conf") }
end

# profile to execute
execute "dynamic-tune" do
  command "tuned-adm profile #{primary_default_profile}"
  action :run
end