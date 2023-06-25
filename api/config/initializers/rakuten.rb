RakutenWebService.configure do |c|
  c.application_id = ENV['RAKUTEN_APPLICATION_ID']
  c.affiliate_id = ENV['RAKUTEN_AFFILIATE_ID']
  c.debug = true
end
