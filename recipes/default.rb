#
# Cookbook Name:: dynamic-perf
# Recipe:: default
#
# Copyright 2015
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'dynamic-perf::os-perf'
include_recipe 'dynamic-perf::config-perf'
include_recipe 'dynamic-perf::system-tools'
