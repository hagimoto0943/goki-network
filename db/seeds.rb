# 10.times do
#   User.create(
#     name: Faker::Name.name,
#     email: Faker::Internet.email,
#     password: 1234567890,
#     password_confirmation: 1234567890
#   )
# end

# 20.times do |index|
#   Post.create(
#     user: User.offset(rand(User.count)).first,
#     title: "タイトル#{index}",
#     body: "本文#{index}",
#     post_types: rand(2)
#   )
# end

require "open-uri"

def desassembly(url)
  charset = nil
  html = URI.open(url) do |f|
    charset = f.charset
    f.read
  end
  doc = Nokogiri::parse(html, charset)
  return doc
end

7.times do |n|
  InsectType.create(
    type: n
  )
end

Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/kinchol_hunter/kinchol/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/kinchol_hunter/kinchol/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/kinchol_hunter/kinchol/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(2),
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/kinchol_hunter/kinchol/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/kinchol_hunter/kinchol/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/kinchol_hunter/kinchol/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(3),
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/kincho_uzumaki/uzumaki/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/kincho_uzumaki/uzumaki/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/kincho_uzumaki/uzumaki/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(2),
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/kincho_uzumaki/uzumaki/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/kincho_uzumaki/uzumaki/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/kincho_uzumaki/uzumaki/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(3),
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/kobae_poton/oku_type/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/kobae_poton/oku_type/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/kobae_poton/oku_type/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(3),
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/kobae_poton/tsuru_type/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/kobae_poton/tsuru_type/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/kobae_poton/tsuru_type/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(3),
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/ka_n_spray/syokukan/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/ka_n_spray/syokukan/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/ka_n_spray/syokukan/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(2),
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/ka_n_spray/12h/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/ka_n_spray/12h/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/ka_n_spray/12h/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(3),
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/go_aerosol/muender/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/go_aerosol/muender/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/go_aerosol/muender/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(4),
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/go_combat/combat/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/go_combat/combat/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/go_combat/combat/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(4),
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/dani_n_spray/spray/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/dani_n_spray/spray/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/dani_n_spray/spray/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(5),
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/dani_n_sheet/sheet/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/dani_n_sheet/sheet/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/dani_n_sheet/sheet/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(5),
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/dani_konners/beads/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/dani_konners/beads/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/dani_konners/beads/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(5),
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/mukade/mukade_kinchol/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/mukade/mukade_kinchol/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/mukade/mukade_kinchol/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(6),
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/mukade/muender/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/mukade/muender/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/mukade/muender/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(6),
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/mukade/mukade_hunter/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/mukade/mukade_hunter/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/mukade/mukade_hunter/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(6),
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/housewares/gongon/closet/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/housewares/gongon/closet/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/housewares/gongon/closet/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(7),
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/housewares/gongon/walk_in_closet/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/housewares/gongon/walk_in_closet/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/housewares/gongon/walk_in_closet/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(7),
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/housewares/gongon_aroma/closet_aroma/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/housewares/gongon_aroma/closet_aroma/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/housewares/gongon_aroma/closet_aroma/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(7),
)
Tool.create(
  url: "https://www.earth.jp/products/nomat-60-skyblue/index.html",
  name: desassembly("https://www.earth.jp/products/nomat-60-skyblue/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/nomat-60-skyblue/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(2),
)
Tool.create(
  url: "https://www.earth.jp/products/nomat-60-skyblue/index.html",
  name: desassembly("https://www.earth.jp/products/nomat-60-skyblue/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/nomat-60-skyblue/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(3),
)
Tool.create(
  url: "https://www.earth.jp/products/earth-jet-450/index.html",
  name: desassembly("https://www.earth.jp/products/earth-jet-450/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/earth-jet-450/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(2),
)
Tool.create(
  url: "https://www.earth.jp/products/earth-jet-450/index.html",
  name: desassembly("https://www.earth.jp/products/earth-jet-450/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/earth-jet-450/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(3),
)
Tool.create(
  url: "https://www.earth.jp/products/kobae-hoihoi/index.html",
  name: desassembly("https://www.earth.jp/products/kobae-hoihoi/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/kobae-hoihoi/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(3),
)
Tool.create(
  url: "https://www.earth.jp/products/goki-jet-pro-otc-450/index.html",
  name: desassembly("https://www.earth.jp/products/goki-jet-pro-otc-450/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/goki-jet-pro-otc-450/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(4),
)
Tool.create(
  url: "https://www.earth.jp/products/goki-jet-pro-450/index.html",
  name: desassembly("https://www.earth.jp/products/goki-jet-pro-450/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/goki-jet-pro-450/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(4),
)
Tool.create(
  url: "https://www.earth.jp/products/black-cap/index.html",
  name: desassembly("https://www.earth.jp/products/black-cap/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/black-cap/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(4),
)
Tool.create(
  url: "https://www.earth.jp/products/black-cap-sukima/index.html",
  name: desassembly("https://www.earth.jp/products/black-cap-sukima/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/black-cap-sukima/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(4),
)
Tool.create(
  url: "https://www.earth.jp/products/black-cap-okugai/index.html",
  name: desassembly("https://www.earth.jp/products/black-cap-okugai/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/black-cap-okugai/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(4),
)
Tool.create(
  url: "https://www.earth.jp/products/goki-hoihoi/index.html",
  name: desassembly("https://www.earth.jp/products/goki-hoihoi/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/goki-hoihoi/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(4),
)
Tool.create(
  url: "https://www.earth.jp/products/earth-red-6-8/index.html",
  name: desassembly("https://www.earth.jp/products/earth-red-6-8/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/earth-red-6-8/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(4),
)
Tool.create(
  url: "https://www.earth.jp/products/earth-red-nonsmoke-6-8/index.html",
  name: desassembly("https://www.earth.jp/products/earth-red-nonsmoke-6-8/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/earth-red-nonsmoke-6-8/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(4),
)
Tool.create(
  url: "https://www.earth.jp/products/dani-earth-300/index.html",
  name: desassembly("https://www.earth.jp/products/dani-earth-300/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/dani-earth-300/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(5),
)
Tool.create(
  url: "https://www.earth.jp/products/earth-red-dani-6-8/index.html",
  name: desassembly("https://www.earth.jp/products/earth-red-dani-6-8/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/earth-red-dani-6-8/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(5),
)
Tool.create(
  url: "https://www.earth.jp/products/earth-red-dani-nonsmoke-6-8/index.html",
  name: desassembly("https://www.earth.jp/products/earth-red-dani-nonsmoke-6-8/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/earth-red-dani-nonsmoke-6-8/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(5),
)
Tool.create(
  url: "https://www.earth.jp/products/dani-hoihoi/index.html",
  name: desassembly("https://www.earth.jp/products/dani-hoihoi/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/dani-hoihoi/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(5),
)
Tool.create(
  url: "https://www.earth.jp/products/mukadekorori-spray-250/index.html",
  name: desassembly("https://www.earth.jp/products/mukadekorori-spray-250/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/mukadekorori-spray-250/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(6),
)
Tool.create(
  url: "https://www.earth.jp/products/mukadekorori-baits/index.html",
  name: desassembly("https://www.earth.jp/products/mukadekorori-baits/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/mukadekorori-baits/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(6),
)
Tool.create(
  url: "https://www.earth.jp/pest-control/centipede/trap/index.html",
  name: desassembly("https://www.earth.jp/pest-control/centipede/trap/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/pest-control/centipede/trap/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(6),
)
Tool.create(
  url: "https://www.earth.jp/pest-control/centipede/powder/index.html",
  name: desassembly("https://www.earth.jp/pest-control/centipede/powder/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/pest-control/centipede/powder/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(6),
)
Tool.create(
  url: "https://www.earth.jp/products/pirepara-hikidashi-ff/index.html",
  name: desassembly("https://www.earth.jp/products/pirepara-hikidashi-ff/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/pirepara-hikidashi-ff/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(7),
)
Tool.create(
  url: "https://www.earth.jp/products/pirepara-magic-push-ff/index.html",
  name: desassembly("https://www.earth.jp/products/pirepara-magic-push-ff/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/pirepara-magic-push-ff/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(7),
)
Tool.create(
  url: "https://www.earth.jp/products/pirepara-boutyuuriki-floralsoap/index.html",
  name: desassembly("https://www.earth.jp/products/pirepara-boutyuuriki-floralsoap/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/pirepara-boutyuuriki-floralsoap/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(7),
)
Tool.create(
  url: "https://www.earth.jp/products/kobae-hoihoi-slim/index.html",
  name: desassembly("https://www.earth.jp/products/kobae-hoihoi-slim/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/kobae-hoihoi-slim/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(3),
)

# Countermeasure.create(
#   title:
#   body:
#   image:
#   insect_type:
# )
