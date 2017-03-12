# adapta_gtk_theme::install
#
# Handles the ppa setup, the adapta-gtk-theme and fonts-roboto packages
#
# @param font_package_ensure  Specifies whether to install the fonts-roboto package, and what version to install
# @param theme_package_ensure Specifies whether to install the adapta-gtk-theme package, and what version to install
class adapta_gtk_theme::install (
  String $font_package_ensure  = $adapta_gtk_theme::params::font_package_ensure,
  String $theme_package_ensure = $adapta_gtk_theme::params::theme_package_ensure,
) inherits adapta_gtk_theme::params {
  include apt
  apt::ppa { 'ppa:tista/adapta': }

  package { 'adapta-gtk-theme':
    ensure => $theme_package_ensure,
  }

  package { 'fonts-roboto':
    ensure => $font_package_ensure,
  }

  Apt::Ppa['ppa:tista/adapta']
    ~> Class['apt::update']
    -> Package['adapta-gtk-theme']
}
