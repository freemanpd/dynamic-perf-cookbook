#
# Cookbook Name:: dynamic-perf
# Author: Patrick Freeman
# Recipe:: postgres
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

# profile to execute
execute "dynamic-tune" do
  command "tuned-adm profile #{primary_default_profile}"
  action :run
end