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

    context 'password is incorrect', :vcr do
      it 'raises an exception' do
        expect do ZabbixMaintenance.new('http://192.168.56.2/zabbix/api_jsonrpc.php',
                                       'wronglogin',
                                       'wrongpw')
              end.to raise_error(/incorrect password/)
      end
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

  describe '.exists?' do
    subject { zbx.exists? }
    context 'when maintenance does not exist on remote server', :vcr do
      it { is_expected.to eq(false) }
    end
    context 'when maintenance exists on remote server', :vcr do
      it do
        zbx.create([2])
        is_expected.to eq(true)
      end
    end
  end

  describe '.authenticated?' do
    context 'when authenticated', :vcr do
      subject { zbx.authenticated? }
      it { is_expected.to eq(true) }
    end
  end

  describe '.maint_id' do
    context 'when maintenance exsts', :vcr do
      it 'returns correct ID' do
        new_id = zbx.create([2])
        expect(zbx.maint_id).to eq(new_id)
        zbx.delete
      end
    end
  end
end
