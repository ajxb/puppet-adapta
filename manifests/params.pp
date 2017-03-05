# adapta_gtk_theme::params
#
# Handles the module default parameters
#
class adapta_gtk_theme::params {

  case $facts['operatingsystem'] {
    'Ubuntu': {
      $package_ensure = 'latest'
    }
    default: {
      fail("${facts['operatingsystem']} not supported")
    }
  }
}
