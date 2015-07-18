#
# Cookbook Name:: dynamic-perf
# Author: Patrick Freeman
# Recipe:: conf-perf
#
# Copyright 2015

# config perf

# vars. loads all external variables from a single location
# require_relative 'vars'
kv_default = "#{node[:'dynamic-perf'][:kernel_vaule]}"
default_profile = "#{node[:'dynamic-perf'][:tune_profile]}"
default_recipe = "#{node[:'dynamic-perf'][:default_tune_recipe]}"

# dynamic profiles
template "/usr/lib/tuned/#{default_profile}/tuned.conf" do
  source "#{default_profile}.conf.erb"
  owner "root"
  group "root"
  mode "0644"
end

# profile to execute
execute "dynamic-tune" do
  command "tuned-adm profile #{default_profile}"
  action :run
end

# dynamic disable?


