require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require_relative '../lib/zabbix_maintenance'

describe ZabbixMaintenance do
  let(:zbx) do
    ZabbixMaintenance.new(
      'http://192.168.56.2/zabbix/api_jsonrpc.php',
      'Admin', 'zabbix')
  end

  describe '.new' do
    it 'fails on missing parameters' do
      expect { subject.new }.to raise_error
    end

    it 'authenticates with correct credentials', :vcr do
      lzbx = ZabbixMaintenance.new('http://192.168.56.2/zabbix/api_jsonrpc.php',
                                   'Admin',
                                   'zabbix')
      expect(lzbx).to be_a ZabbixMaintenance
      expect(lzbx.authenticated?).to eq(true)
    end
  end

  describe '.create' do
    context 'with valid parameters' do
      it 'creates maintenance period: with correct groupid', :vcr do
        res = zbx.create([2], period: 3200)
        expect(res).to be_a Integer
        expect(zbx.id).not_to be_nil
        zbx.delete
      end
    end
  end

  describe '.delete' do
    it 'removes the maintenance', :vcr do
      zbx.create([2])
      expect { zbx.delete }.to change { zbx.exists? }.from(true).to(false)
    end
  end
end
