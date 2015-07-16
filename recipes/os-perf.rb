# os perf

vaule = "#{node[:dynamic-perf][:kernel_vaule]}"
default_profile = "#{node[:dynamic-perf][:tune_profile]}"

%w{tuned numactl irqbalance sadf}.each do |pak|
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

# systat
service 'sysstat' do
  supports :status => true, :restart => true, :reload => true
  action [:start, :enable]
end

# irq balance
service 'irqbalance' do
  supports :status => true, :restart => true, :reload => true
  action [:stop, :disable]
end

# numactl
execute 'numactl' do
  command "echo #{vaule} > /proc/sys/kernel/numa_balancing"
  action :nothing
  notifies :restart, 'service[name]'
  not_if ''
end

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




