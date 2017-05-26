class Ship < ActiveRecord::Base
  belongs_to :citizen

  def self.valid_params?(params)
    !params[:name].empty? && !params[:model].empty? && !params[:manufacturer].empty?
  end

  attr_accessor :name, :url, :summary, :release_date, :metascore, :publisher, :also_on

  def initialize(name = nil, url = nil)
    @name = name
    @url = url
  end

  def self.all
    @@all ||= scrape_ships
  end

  def summary
    @summary ||= doc.xpath("//*[@id='main']/div/div[3]/div/div[2]/div[2]/div[1]/ul/li/span[2]/span").text.strip
  end

  def release_date
    @release_date ||= doc.xpath("//*[@id='main']/div/div[1]/div[2]/ul/li[2]/span[2]").text.strip
  end

  def metascore
    @metascore ||= doc.xpath("//*[@id='main']/div/div[3]/div/div[2]/div[1]/div[1]/div/div/a/div/span").text.strip
  end

  def publisher
    @publisher ||= doc.xpath("//*[@id='main']/div/div[1]/div[2]/ul/li[1]/span[2]/a/span").text.strip
  end

  def also_on
    @also_on ||= doc.xpath("//*[@id='main']/div/div[1]/div[2]/ul/li[3]/span[2]").text.strip
  end

  private
    def self.scrape_ships
      doc = Nokogiri::HTML(open('https://robertsspaceindustries.com/ship-specs', 'User-Agent'=>'chrome'))
      names = doc.search("div[class='basic_stat product_title'] a")
      names.collect{|title| new(title.text.strip, "http://www.metacritic.com#{title.attr("href")}")}
    end

    def doc
      @doc ||= Nokogiri::HTML(open(self.url, 'User-Agent'=>'chrome'))
    end

end
