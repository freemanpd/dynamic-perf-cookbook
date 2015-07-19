# extensible params
default[:'dynamic-perf'][:kernel_vaule] = '0'
default[:'dynamic-perf'][:primary_tune_profile] = "dynamic"
default[:'dynamic-perf'][:secondary_tune_profile] = "dynamic"
default[:'dynamic-perf'][:default_tune_recipe] = "nil"

#### tuned configs ####

# balance.conf
default[:'dynamic-perf'][:balance_governor] = "ondemand"
default[:'dynamic-perf'][:balance_energy_perf_bias] = "normal"
default[:'dynamic-perf'][:balance_audio] = "10"
default[:'dynamic-perf'][:balance_radeon_powersave] = "auto"
default[:'dynamic-perf'][:balance_radeon_disk] = "nil"  # need .each in config file

# desktop
default[:'dynamic-perf'][:desktop_include] = "balanced"
default[:'dynamic-perf'][:desktop_kernel_sched] = "1"

# network-latency default profile 
# note: jenkins, tomcat also use this profile
default[:'dynamic-perf'][:network_latency_include] = "latency_performance"
default[:'dynamic-perf'][:network_latency_transparent_hugepages] = "never"
default[:'dynamic-perf'][:network_latency_net_core_busy_read] = "50"
default[:'dynamic-perf'][:network_latency_net_core_busy_poll] = "50"
default[:'dynamic-perf'][:network_latency_net_ipv4_tcp_fastopen] = "3"
default[:'dynamic-perf'][:network_latency_kernel_numa_balancing] = "0"

# network throughput
# note: docker, lxc also use this profile
default[:'dynamic-perf'][:network_throughput_include] = "throughput-performance"
default[:'dynamic-perf'][:network_throughput_net_ipv4_tcp_rmem] = "4096 87380 16777216"
default[:'dynamic-perf'][:network_throughput_net_ipv4_tcp_wmem] = "4096 16384 16777216"
default[:'dynamic-perf'][:network_throughput_net_ipv4_udp_mem] = "3145728 4194304 16777216"

# throughput-performance.sh
default[:'dynamic-perf'][:throughput_performance_govenor] = "performance"
default[:'dynamic-perf'][:throughput_performance_energy_perf_bias] = "performance"
default[:'dynamic-perf'][:throughput_performance_min_perf_pct] = "100"
default[:'dynamic-perf'][:throughput_performance_transparent_hugepages] = "always"
default[:'dynamic-perf'][:throughput_performance_transparent_readahead] = "4096"
default[:'dynamic-perf'][:throughput_performance_kernel_sched_min_granularity_ns] = "always"
default[:'dynamic-perf'][:throughput_performance_kernel_sched_wakeup_granularity_ns] = "15000000"
default[:'dynamic-perf'][:throughput_performance_vm_dirty_ratio] = "40"
default[:'dynamic-perf'][:throughput_performance_vm_dirty_background_ratio] = "10"
default[:'dynamic-perf'][:throughput_performance_kernel_pid_max] = "65536" # need to intelligently uncomment line in file and add logic for cacluations????
default[:'dynamic-perf'][:throughput_performance_vm_swappiness] = "10"

# powersave
default[:'dynamic-perf'][:powersave_govenor] = "ondemand"
default[:'dynamic-perf'][:powersave_energy_perf_bias] = "powersave"
default[:'dynamic-perf'][:powersave_timeout] = "10"
default[:'dynamic-perf'][:powersave_radeon_powersave] = "auto"
default[:'dynamic-perf'][:powersave_alpm] = "min_power"
default[:'dynamic-perf'][:powersave_net] = "nil" # need .each in config file
default[:'dynamic-perf'][:powersave_vm_laptop_mode] = "5"
default[:'dynamic-perf'][:powersave_vm_dirty_writeback_centisecs] = "1500"
default[:'dynamic-perf'][:powersave_kernel_nmi_watchdog] = "0"
default[:'dynamic-perf'][:powersave_script] = "script.sh"

# sap
default[:'dynamic-perf'][:sap_include] = "throughput-performance"
default[:'dynamic-perf'][:sap_kernel_sem] = "1250 256000 100 8192"
default[:'dynamic-perf'][:sap_vm_max_map_count] = "1000000"
default[:'dynamic-perf'][:sap_script] = "script.sh"

# virtual guest
default[:'dynamic-perf'][:virtual_guest_include] = "throughput-performance"
default[:'dynamic-perf'][:virtual_guest_vm_dirty_ratio] = "30"
default[:'dynamic-perf'][:virtual_guest_vm_swappiness] = "30"

# virtual host
default[:'dynamic-perf'][:virtual_host_include] = "throughput-performance"
default[:'dynamic-perf'][:virtual_host_vm_dirty_background_ratio] = "5"
default[:'dynamic-perf'][:virtual_host_kernel_sched_migration_cost_ns] = "5000000"

# config perf tuning

# dynamic.conf
default[:'dynamic-perf'][:default_tune_recipe] = "nil"

# node
default[:'dynamic-perf'][:node_http_globalAgent_maxSocket] = "1000"
default[:'dynamic-perf'][:node_net_ipv4_ip_local_port_range ] = "18000 65535"
default[:'dynamic-perf'][:node_net_ipv4_netfilter_ip_conntrack_tcp_timeout_time_wait] = "1"
default[:'dynamic-perf'][:node_net_netfilter_nf_conntrack_tcp_timeout_established] = "600"

# nosql 
# note: mongodb, cache use these attributes
default[:'dynamic-perf'][:nosql_vm_nr_hugepages] = "0"
default[:'dynamic-perf'][:nosql_vm_nr_hugepages_mempolicy] = "0"
default[:'dynamic-perf'][:nosql_vm_nr_overcommit_hugepage] = "0"	

# elasticsearch
default[:'dynamic-perf'][:elastic_vm_nr_hugepages] = "0"
default[:'dynamic-perf'][:elastic_vm_nr_hugepages_mempolicy] = "0"
default[:'dynamic-perf'][:elastic_vm_nr_overcommit_hugepage] = "0"	

# SQL
# note: postgres uses these attributes
default[:'dynamic-perf'][:sql_kernel_shmmax] = "17179869184"
default[:'dynamic-perf'][:sql_kernel_shmall] = "4194304"



