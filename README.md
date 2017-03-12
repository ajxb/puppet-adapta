# adapta_gtk_theme

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with adapta_gtk_theme](#setup)
    * [What adapta_gtk_theme affects](#what-adapta_gtk_theme-affects)
    * [Beginning with adapta_gtk_theme](#beginning-with-adapta_gtk_theme)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

The adapta_gtk_theme module installs the [Adapta GTK theme](https://github.com/adapta-project/adapta_gtk_theme) from [ppa](https://launchpad.net/~tista/+archive/ubuntu/adapta) and recommended font [Roboto](https://fonts.google.com/specimen/Roboto) on Ubuntu.

## Setup

### What adapta_gtk_theme affects

* apt configuration to include the Adapta ppa
* gsettings to configure global use of Adapta theme and Roboto fonts

### Beginning with adapta_gtk_theme

To install adapta-gtk-theme and fonts-roboto with default options:

`include adapta_gtk_theme`

To customize options:

```puppet
class { 'adapta_gtk_theme':
  font_package_ensure  => 'latest',
  theme_package_ensure => 'latest',
}
```

## Usage

The default adapta_gtk_theme class installs adapta-gtk-theme and fonts-roboto. To use default configuration:

`include adapta_gtk_theme`

To manually configure the installation:

```puppet
class { 'adapta_gtk_theme':
  font_package_ensure  => 'latest',
  theme_package_ensure => 'latest',
}
```

## Reference

### Classes

#### Public classes

* `adapta_gtk_theme`: Installs adapta-gtk-theme

#### Private classes

* `adapta_gtk_theme::config`: Handles the configuration of the theme and fonts
* `adapta_gtk_theme::params`: Handles the module default parameters
* `adapta_gtk_theme::install`: Handles the ppa setup, the adapta-gtk-theme and fonts-roboto package

### Parameters

The following parameters are available in the `adapta_gtk_theme` class:

#### `font_package_ensure`

Data type: String.

Whether to install the fonts-roboto package and what version to install. Values: The same as used for the puppet package type, see [https://docs.puppet.com/puppet/latest/type.html#package-attribute-ensure](https://docs.puppet.com/puppet/latest/type.html#package-attribute-ensure)

Default value: 'latest'.

#### `theme_package_ensure`

Data type: String.

Whether to install the adapta-gtk-theme package and what version to install. Values: The same as used for the puppet package type, see [https://docs.puppet.com/puppet/latest/type.html#package-attribute-ensure](https://docs.puppet.com/puppet/latest/type.html#package-attribute-ensure)

Default value: 'latest'.

## Limitations

This module has only been tested against Ubuntu 16.04.  As adapta-gtk-theme is a desktop theme this module will only produce tangible results when used with a desktop variant of Ubuntu.

## Development

### Contributing

Before starting your work on this module, you should fork the project to your GitHub account. This allows you to freely experiment with your changes. When your changes are complete, submit a pull request. All pull requests will be reviewed and merged if they suit some general guidelines:

* Changes are located in a topic branch
* For new functionality, proper tests are written
* Changes should not solve certain problems on special environments
* Your change does not handle third party software for which dedicated Puppet modules exist
  * such as creating databases, installing webserver etc.
* Changes follow the recommended Puppet style guidelines from the [Puppet Language Style Guide](https://docs.puppet.com/puppet/latest/style_guide.html)

### Branches

Choosing a proper name for a branch helps us identify its purpose and possibly find an associated bug or feature. Generally a branch name should include a topic such as `bug` or `feature` followed by a description and an issue number if applicable. Branches should have only changes relevant to a specific issue.

```
git checkout -b bug/service-template-typo-1234
git checkout -b feature/config-handling-1235
```

### Running tests

This project contains tests for [rspec-puppet](http://rspec-puppet.com/) to verify functionality. For detailed information on using this tool, please see the relevant documentation.

#### Testing quickstart

```
gem install bundler
bundle install
rake spec
```
