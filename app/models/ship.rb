class Ship < ActiveRecord::Base
  belongs_to :citizen

  def self.valid_params?(params)
    !params[:name].empty? && !params[:model].empty? && !params[:manufacturer].empty?
  end

  def self.all
    @@all ||= scrape_ships
  end

  def model
    @model ||= doc.search("div[class='statbox title'] p").text.strip
  end

  def manufacturer
    @manufacturer ||= doc.search("div[class='statbox manufacturer'] p").text.strip
  end

  def role
    @role ||= doc.search("div[class='statbox role'] p").text.strip
  end

  def description
    @description ||= doc.search("div[class='statbox description'] p span").text.strip
  end

  def production_state
    @production_state ||= doc.search("div[class='statbox role'] p").text.strip
  end

  private
    def self.scrape_ships
      @doc = Nokogiri::HTML(open("https://robertsspaceindustries.com/ship-specs"))
      binding.pry
      ships = @doc.search("div[class='ship']")
      ships.collect{|ship| new(model: self.model, manufacturer: self.manufacturer, role: self.role, description: self.description, production_state: self.production_state)}
    end

    def doc
      @doc ||= Nokogiri::HTML(open('https://robertsspaceindustries.com/ship-specs', 'User-Agent'=>'chrome'))
    end

end
