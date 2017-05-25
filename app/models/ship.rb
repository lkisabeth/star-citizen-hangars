class Ship < ActiveRecord::Base
  belongs_to :citizen

  def self.valid_params?(params)
    !params[:name].empty? && !params[:model].empty? && !params[:manufacturer].empty?
  end

end
