class Scraping

@@i = 1

  def self.get_url
    url_ = []
    url = "http://www.navitime.co.jp"
    first_url = "http://www.navitime.co.jp/category/list?categoryCode=0802001&addressCode=13"
    agent = Mechanize.new
    page = agent.get(first_url)
    elements = page.search("div.area_list ul.address_list li.left a")
    elements.each do |ele|
      url_ << "http://www.navitime.co.jp#{ele.get_attribute('href')}"
    end

    url_.each do |purl|
      put_ward(purl)
      @@i += 1
    end
  end

  def self.get_wear
    i = 1
    url = "http://event.rakuten.co.jp/fashion/ladiesfashion/brand/"
    agent = Mechanize.new
    page = agent.get(url)
    elements = page.search("div#searchfilter ul li a span.brandWrap span.brandNm")
    elements.each do |ele|
      b = ele.inner_text
      a = b[0].downcase!
      p "#{i}:#{a}:#{b}"
      brand = Brand.where(name: b, alphabet: a).first_or_initialize
      brand.save
      i+=1
    end
  end

=begin
    url = "http://www.metro.tokyo.jp/PROFILE/map_to.htm"
    agent = Mechanize.new
    page = agent.get(url)
    ward_elements = page.search("td.bggreen")
    ward_elements.each do |wele|
      ward = Ward.where(name:wele.inner_text).first_or_initialize
      ward.save
    end
=end

  def self.put_ward(url)
    agent = Mechanize.new
    page = agent.get(url)
    elements = page.search("ul li.list_frame dl.list_item_frame dt.spot_name a")
    elements.each do |ele|
      station = Station.where(name: ele.inner_text.chomp,ward_id: @@i).first_or_initialize
      station.save
    end
  end

end