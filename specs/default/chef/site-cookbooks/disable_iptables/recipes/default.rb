

::DisableIpTables::Helpers.saveIpTables('/etc/sysconfig/iptables.backup')
::DisableIpTables::Helpers.flushIpTables()
::DisableIpTables::Helpers.saveIpTables('/etc/sysconfig/iptables')

