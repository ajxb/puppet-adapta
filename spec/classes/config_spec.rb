require 'spec_helper'

describe 'adapta_gtk_theme::config' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      context 'configure adapta with defaults' do
        it do
          should contain_gnome__gsettings('org.gnome.desktop.wm.preferences_theme').with(
            schema: 'org.gnome.desktop.wm.preferences',
            key:    'theme',
            value:  '"Adapta"'
          )
        end
        it do
          should contain_gnome__gsettings('org.gnome.desktop.interface_gtk-theme').with(
            schema: 'org.gnome.desktop.interface',
            key:    'gtk-theme',
            value:  '"Adapta"'
          )
        end
      end
    end
  end
end
