# os perf

vaule = "#{node[:dynamic-perf][:kernel_vaule]}"

%w{tuned numactl}.each do |pak|
  package "#{pak}" do
    action :install
    notifies :run, 'execute[numactl]'
  end
end

# tuned
service 'tuned' do
  supports :status => true, :restart => true, :reload => true
  action [:start, :enable]
end

# numactl
execute 'numactl' do
  command "echo #{vaule} > /proc/sys/kernel/numa_balancing"
  action :nothing
  notifies :restart, 'service[name]'
  not_if ''
end


