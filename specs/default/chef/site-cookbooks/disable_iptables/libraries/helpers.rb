require 'chef/mixin/shell_out'

module DisableIpTables
  class Helpers

    def self.saveIpTables(target)
      result = Mixlib::ShellOut.new("/sbin/iptables-save > #{target}").run_command
      if result.error?
        result.error!
      elsif !result.error?
        nil
      end
    end
    
    def self.flushIpTables()
      flush_cmd = <<-EOC
      iptables -P INPUT ACCEPT;
      iptables -P FORWARD ACCEPT;
      iptables -P OUTPUT ACCEPT;
      iptables -t nat -F;
      iptables -t mangle -F;
      iptables -F;
      iptables -X;
      iptables -L;
      touch /etc/sysconfig/iptables.flushed
      EOC
      
      result = Mixlib::ShellOut.new(flush_cmd).run_command
      if result.error?
        result.error!
      elsif !result.error?
        nil
      end      
    end

  end
end

