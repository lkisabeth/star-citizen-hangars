require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

set :public_folder, Proc.new { File.join(root, "public") }

use Rack::MethodOverride

use CitizensController
use ShipsController
run ApplicationController
