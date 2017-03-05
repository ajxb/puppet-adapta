# adapta_gtk_theme::install
#
# Handles the ppa setup and the adapta-gtk-theme package
#
# @param package_ensure Specifies whether to install the adapta-gtk-theme package, and what version to install
class adapta_gtk_theme::install (
  String $package_ensure = $adapta_gtk_theme::params::package_ensure,
) inherits adapta_gtk_theme::params {
  include apt
  apt::ppa { 'ppa:tista/adapta': }

  package { 'adapta-gtk-theme':
    ensure => $package_ensure,
  }

  Apt::Ppa['ppa:tista/adapta']
    ~> Class['apt::update']
    -> Package['adapta-gtk-theme']
}
