require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require_relative '../lib/zabbix_maintenance'

describe ZabbixMaintenance do
  describe '.new' do
    it 'fails on missing parameters' do
      expect { subject.new }.to raise_error
    end

    it 'authenticates with correct credentials', :vcr do
      zbx = ZabbixMaintenance.new('http://192.168.56.2/zabbix/api_jsonrpc.php',
                                  'Admin',
                                  'zabbix')
      expect(zbx).to be_a ZabbixMaintenance
      expect(zbx.authenticated?).to eq(true)
    end
  end

  describe '.create' do
    let(:zbx) do
      ZabbixMaintenance.new(
        'http://192.168.56.2/zabbix/api_jsonrpc.php',
        'Admin', 'zabbix')
    end
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
  end
end
