require 'spec_helper'

describe 'adapta_gtk_theme' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      it { should compile.with_all_deps }
      it { should contain_class('adapta_gtk_theme') }
      it { should contain_class('adapta_gtk_theme::config') }
      it { should contain_class('adapta_gtk_theme::install') }
      it { should contain_class('adapta_gtk_theme::params') }
    end
  end

  context 'with unsupported operatingsystem' do
    let :facts do
      {
        operatingsystem: 'Unsupported OS'
      }
    end

    it do
      expect do
        subject.call
      end.to raise_error(Puppet::Error, /Unsupported OS not supported/)
    end
  end
end
