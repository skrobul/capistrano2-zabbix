require 'zabbixapi'

# Communicates with Zabbix through API and performs actions on
# maintenance objects.
class ZabbixMaintenance
  attr_reader :id, :maint_title, :zbx

  def initialize(url, user, password, title: 'capistrano auto maintenance')
    begin
      @zbx = ZabbixApi.connect(url: url, user: user, password: password)
    rescue RuntimeError => e
      if e.message =~ /password is incorrect/
        fail 'Login failed - incorrect password.'
      else
        fail "Error while connecting to Zabbix: #{e}"
      end
    end

    @maint_title = title
    @id = nil
  end

  def maint_id
    ret = @zbx.query method: 'maintenance.get', params: {
      'search' => {
        'name' => @maint_title
      }
    }
    begin
      ret.first['maintenanceid'].to_i
    rescue KeyError
      nil
    end
  end

  def create_or_replace(*args)
    delete(id: maint_id) if exists?
    create(*args)
  end

  def create(groupids, period: 3600)
    maint_params = {
      name: @maint_title,
      active_since: Time.now.to_i - 200,
      active_till: Time.now.to_i + 866_00,
      groupids: groupids,
      timeperiods: [{ period: period }]
    }
    ret = @zbx.query method: 'maintenance.create', params: maint_params
    @id = ret['maintenanceids'].first.to_i
  end

  def delete(id: @id)
    ret = @zbx.query method: 'maintenance.delete', params: [id]
    unless ret['maintenanceids'] == [id]
      fail "Maintenance id:#{id} has not been deleted"
    end
    true
  end

  def exists?
    @zbx.query method: 'maintenance.exists', params: { name: @maint_title }
  end

  def authenticated?
    !(@zbx.nil? || @zbx.client.auth.nil?)
  end
end
