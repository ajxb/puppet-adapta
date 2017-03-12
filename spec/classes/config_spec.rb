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

        it do
          should contain_gnome__gsettings('org.gnome.desktop.interface_document-font-name').with(
            schema: 'org.gnome.desktop.interface',
            key:    'document-font-name',
            value:  '"Roboto 10"'
          )
        end
        it do
          should contain_gnome__gsettings('org.gnome.desktop.interface_font-name').with(
            schema: 'org.gnome.desktop.interface',
            key:    'font-name',
            value:  '"Roboto 10"'
          )
        end
        it do
          should contain_gnome__gsettings('org.gnome.desktop.interface_monospace-font-name').with(
            schema: 'org.gnome.desktop.interface',
            key:    'monospace-font-name',
            value:  '"Ubuntu Mono 11"'
          )
        end
        it do
          should contain_gnome__gsettings('org.gnome.desktop.wm.preferences_titlebar-font').with(
            schema: 'org.gnome.desktop.wm.preferences',
            key:    'titlebar-font',
            value:  '"Roboto Bold 10"'
          )
        end
      end

      context 'remove adapta theme' do
        let :params do
          {
            theme_package_ensure: 'absent'
          }
        end

        it do
          should contain_gnome__gsettings('org.gnome.desktop.wm.preferences_theme').with(
            schema: 'org.gnome.desktop.wm.preferences',
            key:    'theme',
            value:  '"Ambiance"'
          )
        end
        it do
          should contain_gnome__gsettings('org.gnome.desktop.interface_gtk-theme').with(
            schema: 'org.gnome.desktop.interface',
            key:    'gtk-theme',
            value:  '"Ambiance"'
          )
        end
      end

      context 'remove roboto font' do
        let :params do
          {
            font_package_ensure: 'absent'
          }
        end

        it do
          should contain_gnome__gsettings('org.gnome.desktop.interface_document-font-name').with(
            schema: 'org.gnome.desktop.interface',
            key:    'document-font-name',
            value:  '"Sans 11"'
          )
        end
        it do
          should contain_gnome__gsettings('org.gnome.desktop.interface_font-name').with(
            schema: 'org.gnome.desktop.interface',
            key:    'font-name',
            value:  '"Ubuntu 11"'
          )
        end
        it do
          should contain_gnome__gsettings('org.gnome.desktop.interface_monospace-font-name').with(
            schema: 'org.gnome.desktop.interface',
            key:    'monospace-font-name',
            value:  '"Ubuntu Mono 13"'
          )
        end
        it do
          should contain_gnome__gsettings('org.gnome.desktop.wm.preferences_titlebar-font').with(
            schema: 'org.gnome.desktop.wm.preferences',
            key:    'titlebar-font',
            value:  '"Ubuntu Bold 11"'
          )
        end
      end
    end
  end
end
