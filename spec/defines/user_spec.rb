require 'spec_helper'

describe 'adapta_gtk_theme::user', type: :define do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      let :title do
        'test_user'
      end

      it { is_expected.to contain_class('adapta_gtk_theme::install') }
      it { is_expected.to contain_adapta_gtk_theme__user('test_user') }
      it do
        is_expected.to contain_exec('Enable adapta as desktop theme for test_user').with(
          user:    'test_user',
          require: 'User[test_user]'
        )
      end
      it do
        is_expected.to contain_exec('Enable adapta as wm theme for test_user').with(
          user:    'test_user',
          require: 'User[test_user]'
        )
      end
    end
  end
end
