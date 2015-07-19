#
# Cookbook Name:: dynamic-perf
# Author: Patrick Freeman
# Recipe:: dynamic
#
# Copyright 2015

# create dyanmic directory
directory '/etc/tuned/dynamic' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end


