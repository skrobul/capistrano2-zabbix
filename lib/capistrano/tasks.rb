require 'capistrano'
require_relative '../zabbix_maintenance'

Capistrano::Configuration.instance.load do
  def set_default(pname, *args, &bl)
    set(pname, *args, &bl) unless exists? pname
  end

  # Defaults
  set_default(:zabbix_url)  { 'http://192.168.56.2/zabbix/' }
  set_default(:zabbix_user) { 'Admin' }
  set_default(:zabbix_password) { 'zabbix' }
  set_default(:zabbix_period) { 60 * 60 * 10 } # 10 hours
  set_default(:zabbix_groupid) { 2 }

  namespace :zabbix do
    desc 'Create maintenance in Zabbix'
    task :create do
      create_maintenance
    end
  end

  def create_maintenance
    zbx = ZabbixMaintenance.new("#{zabbix_url}/api_jsonrpc.php",
                                zabbix_user,
                                zabbix_password)
    set(:zbx_handle, zbx)
    zbx.create [zabbix_groupid], period: zabbix_period
  end

  def delete_maintenance
    zbx_handle.delete
  end
end
