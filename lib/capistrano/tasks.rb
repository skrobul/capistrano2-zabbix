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
  set_default(:zabbix_auto_trigger) { true }

  namespace :zabbix do
    desc 'Create maintenance in Zabbix'
    task :create do
      zm_api.create_or_replace [zabbix_groupid], period: zabbix_period
    end

    desc 'Delete maintenance in Zabbix'
    task :delete do
      zm_api.delete(id: zm_api.maint_id)
    end
  end
  # has to be set before the plugin is actually required
  if zabbix_auto_trigger
    before 'deploy:update',           'zabbix:create'
    after 'deploy:restart',         'zabbix:delete'
  end

  def zm_api
    zbx = ZabbixMaintenance.new("#{zabbix_url}/api_jsonrpc.php",
                                zabbix_user,
                                zabbix_password)
    set(:zbx_handle, zbx)
  end
end
