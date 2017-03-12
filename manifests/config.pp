# adapta_gtk_theme::config
#
# Configures the adapta theme and Roboto font as system defaults
#
# @param font_package_ensure  Specifies whether to install the fonts-roboto package, and what version to install
# @param theme_package_ensure Specifies whether to install the adapta-gtk-theme package, and what version to install
class adapta_gtk_theme::config (
  String $font_package_ensure  = $adapta_gtk_theme::params::font_package_ensure,
  String $theme_package_ensure = $adapta_gtk_theme::params::theme_package_ensure,
) inherits adapta_gtk_theme::params {
  if ($theme_package_ensure == 'absent') or ($theme_package_ensure == 'purged') {
    gnome::gsettings { 'org.gnome.desktop.wm.preferences_theme':
      schema => 'org.gnome.desktop.wm.preferences',
      key    => 'theme',
      value  => '"Ambiance"',
    }

    gnome::gsettings { 'org.gnome.desktop.interface_gtk-theme':
      schema => 'org.gnome.desktop.interface',
      key    => 'gtk-theme',
      value  => '"Ambiance"',
    }
  } else {
    gnome::gsettings { 'org.gnome.desktop.wm.preferences_theme':
      schema  => 'org.gnome.desktop.wm.preferences',
      key     => 'theme',
      value   => '"Adapta"',
      require => Package['adapta-gtk-theme'],
    }

    gnome::gsettings { 'org.gnome.desktop.interface_gtk-theme':
      schema  => 'org.gnome.desktop.interface',
      key     => 'gtk-theme',
      value   => '"Adapta"',
      require => Package['adapta-gtk-theme'],
    }
  }

  if ($font_package_ensure == 'absent') or ($font_package_ensure == 'purged') {
    gnome::gsettings { 'org.gnome.desktop.interface_document-font-name':
      schema => 'org.gnome.desktop.interface',
      key    => 'document-font-name',
      value  => '"Sans 11"',
    }

    gnome::gsettings { 'org.gnome.desktop.interface_font-name':
      schema => 'org.gnome.desktop.interface',
      key    => 'font-name',
      value  => '"Ubuntu 11"',
    }

    gnome::gsettings { 'org.gnome.desktop.interface_monospace-font-name':
      schema => 'org.gnome.desktop.interface',
      key    => 'monospace-font-name',
      value  => '"Ubuntu Mono 13"',
    }

    gnome::gsettings { 'org.gnome.desktop.wm.preferences_titlebar-font':
      schema => 'org.gnome.desktop.wm.preferences',
      key    => 'titlebar-font',
      value  => '"Ubuntu Bold 11"',
    }
  } else {
    gnome::gsettings { 'org.gnome.desktop.interface_document-font-name':
      schema  => 'org.gnome.desktop.interface',
      key     => 'document-font-name',
      value   => '"Roboto 10"',
      require => Package['fonts-roboto'],
    }

    gnome::gsettings { 'org.gnome.desktop.interface_font-name':
      schema  => 'org.gnome.desktop.interface',
      key     => 'font-name',
      value   => '"Roboto 10"',
      require => Package['fonts-roboto'],
    }

    gnome::gsettings { 'org.gnome.desktop.interface_monospace-font-name':
      schema  => 'org.gnome.desktop.interface',
      key     => 'monospace-font-name',
      value   => '"Ubuntu Mono 11"',
      require => Package['fonts-roboto'],
    }

    gnome::gsettings { 'org.gnome.desktop.wm.preferences_titlebar-font':
      schema  => 'org.gnome.desktop.wm.preferences',
      key     => 'titlebar-font',
      value   => '"Roboto Bold 10"',
      require => Package['fonts-roboto'],
    }
  }
}
