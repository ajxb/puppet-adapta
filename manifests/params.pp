# adapta::params
#
# Handles the module default parameters
#
class adapta::params {

  case $facts['operatingsystem'] {
    'Ubuntu': {
      $package_ensure = 'latest'
    }
    default: {
      fail("${facts['operatingsystem']} not supported")
    }
  }
}
