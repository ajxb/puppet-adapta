# Class: adapta
#
# Manage installation and configuration of adapta on Ubuntu, installing from ppa
#
# @example Declaring the class
#   include adapta
# @example Declaring the class with parameters
#   class { 'adapta':
#     package_ensure => true,
#   }
#
# @param package_ensure Specifies whether to install the adapta package, and what version to install
class adapta (
  String  $package_ensure = $adapta::params::package_ensure,
) inherits adapta::params {

  class { 'adapta::install':
    package_ensure => $package_ensure,
  }

  contain adapta::install
}
