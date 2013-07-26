class Viglink
  attr_accessor :url, :viglink_url
  @API_KEY = '576eee7743ab5f5bd88a84fd947d2358'
  def initialize(url)
    @url = url
  end

  def fetch_link
    conn = Faraday.new(url: 'http://api.viglink.com') do |faraday|
      faraday.use      FaradayMiddleware::ParseJson, content_type: /\bjson$/
      faraday.adapter  Faraday.default_adapter
    end

    response = conn.get do |req|
      req.url  '/api/click'
      req.params['key'] = @API_KEY
      req.params['out'] = @url
      req.params['loc'] = 'http://doucheyshirts.com'
      req.params['format'] = 'jsonp'
    end

    @viglink_url = response 
  end
end
