class Citizen < ActiveRecord::Base
  has_many :ships

  has_secure_password

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Citizen.all.find{|citizen| citizen.slug == slug}
  end

end
