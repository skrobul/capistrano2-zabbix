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

  namespace :zabbix do
    desc 'Create maintenance in Zabbix'
    task :create do
      create_maintenance
    end
  end

  def create_maintenance
    zbx = ZabbixMaintenance.new(zabbix_url,
                                zabbix_user,
                                zabbix_password,
                                period: zabbix_period)
    set(:zbx_handle, zbx)
    zbx.create
  end

  def delete_maintenance
    zbx_handle.delete
  end
end
