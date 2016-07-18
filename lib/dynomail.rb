require 'hanami/model'
require 'hanami/mailer'
Dir["#{ __dir__ }/dynomail/**/*.rb"].each { |file| require_relative file }

Hanami::Model.configure do
  ##
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/dynomail_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/dynomail_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/dynomail_development'
  #    adapter type: :sql, uri: 'mysql://localhost/dynomail_development'
  #
  adapter type: :sql, uri: ENV['DYNOMAIL_DATABASE_URL']

  ##
  # Migrations
  #
  migrations 'db/migrations'
  schema     'db/schema.sql'

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  # You can specify mapping file to load with:
  #
  # mapping "#{__dir__}/config/mapping"
  #
  # Alternatively, you can use a block syntax like the following:
  #
  mapping do
    collection :contents do
      entity     Content
      repository ContentRepository

      attribute :url,         String
      attribute :title,       String
      attribute :image_url,   String
      attribute :description, String
      attribute :list,        String
    end
  end
end.load!

Hanami::Mailer.configure do
  root "#{ __dir__ }/dynomail/mailers"

  # See http://hanamirb.org/guides/mailers/delivery
  delivery do
    development :test
    test        :test
    # production :stmp, address: ENV['SMTP_PORT'], port: 1025
  end
end.load!
