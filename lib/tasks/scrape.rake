require 'open-uri'
namespace :scrape do
  desc '害虫駆除グッズの情報取得'
  task kincho_title: :environment do
    url = 'https://www.irasutoya.com/2019/02/blog-post_51.html'
    charset = nil
    html = URI.parse(url) do |f|
      charset = f.charset
      f.read
    end
    doc = Nokogiri.parse(html, charset)
    p doc.css('//meta[property="og:image"]/@content').to_s
    p doc.css('//meta[property="og:title"]/@content').to_s
  end
end
