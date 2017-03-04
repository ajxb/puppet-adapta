# adapta::install
#
# Handles the ppa setup and the adapta package
#
# @param package_ensure Specifies whether to install the adapta package, and what version to install
class adapta::install (
  String $package_ensure = $adapta::params::package_ensure,
) inherits adapta::params {
  include apt
  apt::ppa { 'ppa:tista/adapta': }

  package { 'adapta-gtk-theme':
    ensure => $package_ensure,
  }

  Apt::Ppa['ppa:tista/adapta']
    ~> Class['apt::update']
    -> Package['adapta-gtk-theme']
}
