#
# Cookbook Name:: dynamic-perf
# Author: Patrick Freeman
# Recipe:: cron
#
# Copyright 2015

# optional cron jobs
include_recipe 'dynamic-perf::config-perf'

kv_default = "#{node['dynamic-perf']['kernel_vaule']}"
primary_default_profile = "#{node['dynamic-perf']['primary_tune_profile']}"
secondary_default_profile = "#{node['dynamic-perf']['secondary_tune_profile']}"
default_recipe = "#{node['dynamic-perf']['tune_recipe']}"


# cron dynamic primary
cron 'primary-perf' do
  hour '0'
  minute '0'
  command 'tuned-adm  profile #{primary_default_profile}'
end

# cron dynamic secondary
cron 'secondary-perf' do
  hour '6'
  minute '0'
  command 'tuned-adm  profile #{secondary_default_profile}'
end

