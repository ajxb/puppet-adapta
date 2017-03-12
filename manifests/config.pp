# adapta_gtk_theme::config
#
# Configures the adapta theme as system default
#
# @param package_ensure Specifies whether to install the adapta-gtk-theme package, and what version to install
class adapta_gtk_theme::config (
  String $package_ensure = $adapta_gtk_theme::params::package_ensure,
) inherits adapta_gtk_theme::params {
  gnome::gsettings { 'org.gnome.desktop.wm.preferences_theme':
    schema  => 'org.gnome.desktop.wm.preferences',
    key     => 'theme',
    value   => '"Adapta"',
    require => Package['adapta-gtk-theme'],
  }

  gnome::gsettings { 'org.gnome.desktop.interface_gtk-theme':
    schema  => 'org.gnome.desktop.interface',
    key     => 'gtk-theme',
    value   => '"Adapta"',
    require => Package['adapta-gtk-theme'],
  }
}
