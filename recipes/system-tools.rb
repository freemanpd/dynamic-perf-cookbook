# tools for generating and collecting performance metrics


# perf iostat pgrep ss 
# note: most tools should be installed by default

[
'perf',
'procps-ng', 
'dstat',
'blktrace',
'tcpdump',
'strace'
].each do |pak|
	yum_package "#{pak}" do
	  action :install
	end
end