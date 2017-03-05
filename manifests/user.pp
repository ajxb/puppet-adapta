# adapta_gtk_theme::user
#
# Enable the adapta-gtk-theme for the provided user
#
# @param user_name The user account for which to enable the adapta-gtk-theme
define adapta_gtk_theme::user (
  String $user_name = $name,
) {
  require adapta_gtk_theme::install

  exec { "Enable adapta as desktop theme for ${user_name}":
    command => 'dbus-launch gsettings set org.gnome.desktop.interface gtk-theme \'Adapta\'',
    unless  => 'dbus-launch gsettings get org.gnome.desktop.interface gtk-theme | grep \'Adapta\'',
    user    => $user_name,
    path    => [
      '/bin',
      '/usr/bin'
    ],
    require => User[$user_name],
  }

  exec { "Enable adapta as wm theme for ${user_name}":
    command => 'dbus-launch gsettings set org.gnome.desktop.wm.preferences theme \'Adapta\'',
    unless  => 'dbus-launch gsettings get org.gnome.desktop.wm.preferences theme | grep \'Adapta\'',
    user    => $user_name,
    path    => [
      '/bin',
      '/usr/bin'
    ],
    require => User[$user_name],
  }
}