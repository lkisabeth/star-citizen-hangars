ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

configure :development do
  ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)
end

configure :production do
  db = URI.parse(ENV['postgres://kkwphefkmktlbn:a3a700f56ad25153522598488c8ba220a0f114114701cd85f97497e47b2a6216@ec2-107-22-250-33.compute-1.amazonaws.com:5432/d8hvldpq3d4ock'] || 'postgres://localhost/mydb')

  ActiveRecord::Base.establish_connection(
    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
end

require_all 'app'
require 'open-uri'
