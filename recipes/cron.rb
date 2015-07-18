#
# Cookbook Name:: dynamic-perf
# Author: Patrick Freeman
# Recipe:: cron
#
# Copyright 2015

# optional cron jobs

#require_relative 'vars'

kv_default = "#{node[:'dynamic-perf'][:kernel_vaule]}"
default_profile = "#{node[:'dynamic-perf'][:tune_profile]}"
default_recipe = "#{node[:'dynamic-perf'][:default_tune_recipe]}"

# cron dynamic powersave
cron 'powersave' do
  hour '0'
  minute '0'
  command 'tuned-adm  profile powersave'
end

# cron dynamic profile
cron 'dynamic' do
  hour '6'
  minute '0'
  command 'tuned-adm  profile #{default_profile}'
end