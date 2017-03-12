# Class: adapta_gtk_theme
#
# Manage installation and configuration of adapta-gtk-theme on Ubuntu along with recommended font roboto, installing from ppa
#
# @example Declaring the class
#   include adapta_gtk_theme
# @example Declaring the class with parameters
#   class { 'adapta_gtk_theme':
#     font_package_ensure  => 'latest',
#     theme_package_ensure => 'latest',
#   }
#
# @param font_package_ensure  Specifies whether to install the fonts-roboto package, and what version to install
# @param theme_package_ensure Specifies whether to install the adapta-gtk-theme package, and what version to install
class adapta_gtk_theme (
  String $font_package_ensure  = $adapta_gtk_theme::params::font_package_ensure,
  String $theme_package_ensure = $adapta_gtk_theme::params::theme_package_ensure,
) inherits adapta_gtk_theme::params {

  class { 'adapta_gtk_theme::install':
    font_package_ensure  => $font_package_ensure,
    theme_package_ensure => $theme_package_ensure,
  }

  class { 'adapta_gtk_theme::config':
    font_package_ensure  => $font_package_ensure,
    theme_package_ensure => $theme_package_ensure,
  }

  contain adapta_gtk_theme::install
  contain adapta_gtk_theme::config

  Class['adapta_gtk_theme::install']
    -> Class['adapta_gtk_theme::config']
}
