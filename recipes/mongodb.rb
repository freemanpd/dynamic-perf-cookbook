#
# Cookbook Name:: dynamic-perf
# Author: Patrick Freeman
# Recipe:: mongo
#
# Copyright 2015

# numa disable
notifies :stop,:disable, 'service[numactl]'
vm.nr_hugepages = 0
vm.nr_hugepages_mempolicy = 0
vm.nr_overcommit_hugepages = 0
