## 2017-03-12 Release 1.3.0
### Summary :

This is a breaking change, adapta_gtk_theme::user has been removed to use global settings.

* Update to use [camptocamp/gnome](https://github.com/camptocamp/puppet-gnome) module for global configuration of theme in place of user specific configuration
* Removed adapta_gtk_theme::user class
* Update to reset configuration to Ubuntu defaults when packages are removed
* Add installation and configuration of roboto font package

## 2017-03-05 Release 1.2.0
### Summary :

* Add adapta_gtk_theme::user defined type to enable the theme for a given user

## 2017-03-05 Release 1.1.0
### Summary :

This is a breaking change, any use of the adapta module in Puppet will require changing to reference adapta_gtk_theme.

* Rename module to adapta_gtk_theme

## 2017-03-04 Release 1.0.0
### Summary :

* Initial release of adapta module
