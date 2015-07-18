#
# Cookbook Name:: dynamic-perf
# Author: Patrick Freeman
# Recipe:: httpd
#
# Copyright 2015

# numa enabled
notifies :start,:enable, 'service[numactl]'
