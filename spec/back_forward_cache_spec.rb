require 'spec_helper'

describe 'ie::back_forward_cache' do
  context 'windows' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'windows', version: '2008R2') do |node|
        node.set['ie']['back_forward_cache'] = true
        # node.set['kernel']['machine'] = 'x86_64'
      end.converge(described_recipe)
    end

    it 'enables back forward cache' do
      create_registry_key('HKLM\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BFCACHE')
        .with(name: 'iexplore.exe', type: :dword, data: 0)
    end
  end

  context 'not windows' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new.converge(described_recipe)
    end

    it 'should warn if not Windows platform' do
      expect(chef_run).to write_log('Recipe ie::back_forward_cache is only available for Windows platforms!')
    end
  end
end
