require 'rubygems'
require 'bundler/setup'
require 'hanami/setup'
require_relative '../lib/dynomail'
require_relative '../apps/cms/application'
require_relative '../apps/web/application'

Hanami::Container.configure do
  mount Cms::Application, at: '/cms'
  mount Web::Application, at: '/'
end
