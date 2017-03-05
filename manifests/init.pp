# Class: adapta_gtk_theme
#
# Manage installation and configuration of adapta-gtk-theme on Ubuntu, installing from ppa
#
# @example Declaring the class
#   include adapta_gtk_theme
# @example Declaring the class with parameters
#   class { 'adapta_gtk_theme':
#     package_ensure => true,
#   }
#
# @param package_ensure Specifies whether to install the adapta-gtk-theme package, and what version to install
class adapta_gtk_theme (
  String  $package_ensure = $adapta_gtk_theme::params::package_ensure,
) inherits adapta_gtk_theme::params {

  class { 'adapta_gtk_theme::install':
    package_ensure => $package_ensure,
  }

  contain adapta_gtk_theme::install
}
