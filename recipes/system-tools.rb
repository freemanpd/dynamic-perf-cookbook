# tools for generating and collecting performance metrics
#
# Cookbook Name:: dynamic-perf
# Author: Patrick Freeman
# Recipe:: system-tools
#
# Copyright 2015

# perf iostat pgrep ss 
# note: most tools should be installed by default

[
'blktrace',
'dstat',
'ethtool',
'gnuplot',
'hwloc',
'ltrace',
'netsniff-ng',
'net-tools',
'pciutils',
'perf',
'procps-ng',
'psmisc', 
'strace',
'tcpdump'
].each do |pak|
	yum_package "#{pak}" do
	  action :install
	end
end