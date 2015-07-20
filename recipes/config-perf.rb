#
# Cookbook Name:: dynamic-perf
# Author: Patrick Freeman
# Recipe:: conf-perf
#
# Copyright 2015

# config perf

# vars. loads all external variables from a single location
# require_relative 'vars'
kv_default = "#{node['dynamic-perf']['kernel_vaule']}"
primary_default_profile = "#{node['dynamic-perf']['primary_tune_profile']}"
secondary_default_profile = "#{node['dynamic-perf']['secondary_tune_profile']}"
default_recipe = "#{node['dynamic-perf']['tune_recipe']}"



# dynamic profiles
template "/etc/tuned/#{primary_default_profile}/tuned.conf" do
  source "#{primary_default_profile}.conf.erb"
  owner "root"
  group "root"
  mode "0644"
end

# dynamic disable?


