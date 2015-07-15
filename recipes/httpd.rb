
# numa enabled
notifies :start,:enable, 'service[numactl]'
