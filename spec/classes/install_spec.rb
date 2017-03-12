require 'spec_helper'

describe 'adapta_gtk_theme::install' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      context 'configure the adapta ppa' do
        it { should contain_apt__ppa('ppa:tista/adapta') }
      end

      context 'install adapta with defaults' do
        it { should contain_package('adapta-gtk-theme').with_ensure('latest') }
        it { should contain_package('fonts-roboto').with_ensure('latest') }
      end

      context 'remove adapta theme' do
        let :params do
          {
            theme_package_ensure: 'absent'
          }
        end

        it { should contain_package('adapta-gtk-theme').with_ensure('absent') }
      end

      context 'remove roboto font' do
        let :params do
          {
            font_package_ensure: 'absent'
          }
        end

        it { should contain_package('fonts-roboto').with_ensure('absent') }
      end

      it { should contain_apt__ppa('ppa:tista/adapta').that_notifies('Class[apt::update]') }
      it { should contain_package('adapta-gtk-theme').that_requires('Class[apt::update]') }
    end
  end
end
