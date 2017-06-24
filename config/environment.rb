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
  db = URI.parse(ENV['postgres://ltrjpijzophvof:6fb2ebef39bc20f5f6b760e64bfbd09641f7b008f5d8733f1199ac3a3e5ac261@ec2-50-19-219-69.compute-1.amazonaws.com:5432/dbd6fu5cgpcqtp'] || 'postgres://localhost/mydb')

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
