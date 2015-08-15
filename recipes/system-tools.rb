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
'ethtool',
'dropwatch',
'dstat',
'ethtool',
'gnuplot',
'hwloc',
'iftop',
'kernel-tools',
'ltrace',
'netsniff-ng',
'net-tools',
'pciutils',
'perf',
'powertop',
'procps-ng',
'psmisc',
'sos', 
'strace',
'tcpdump',
'tuna',
'trace-cmd'
].each do |pak|
	yum_package "#{pak}" do
	  action :install
	end
end
