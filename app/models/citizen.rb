class Citizen < ActiveRecord::Base
  has_secure_password
  has_many :ships
end
