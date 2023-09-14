10.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 1234567890,
    password_confirmation: 1234567890
  )
end

20.times do |index|
  Post.create(
    user: User.offset(rand(User.count)).first,
    title: "タイトル#{index}",
    body: "本文#{index}",
    post_types: rand(2)
  )
end

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

2.times do |n|
  ExterminationType.create(
    kind: n
  )
end
9.times do |n|
  Place.create(
    spot: n
  )
end

Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/kinchol_hunter/kinchol/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/kinchol_hunter/kinchol/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/kinchol_hunter/kinchol/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(2),
  extermination_type: ExterminationType.find(1),
  place: Place.find(1)
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/kinchol_hunter/kinchol/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/kinchol_hunter/kinchol/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/kinchol_hunter/kinchol/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(3),
  extermination_type: ExterminationType.find(1),
  place: Place.find(1)
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/kincho_uzumaki/uzumaki/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/kincho_uzumaki/uzumaki/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/kincho_uzumaki/uzumaki/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(2),
  extermination_type: ExterminationType.find(2),
  place: Place.find(7)
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/kincho_uzumaki/uzumaki/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/kincho_uzumaki/uzumaki/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/kincho_uzumaki/uzumaki/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(3),
  extermination_type: ExterminationType.find(2),
  place: Place.find(7)
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/kobae_poton/oku_type/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/kobae_poton/oku_type/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/kobae_poton/oku_type/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(3),
  extermination_type: ExterminationType.find(1),
  place: Place.find(4)
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/kobae_poton/tsuru_type/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/kobae_poton/tsuru_type/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/kobae_poton/tsuru_type/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(3),
  extermination_type: ExterminationType.find(1),
  place: Place.find(4)
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/ka_n_spray/syokukan/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/ka_n_spray/syokukan/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/ka_n_spray/syokukan/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(2),
  extermination_type: ExterminationType.find(2),
  place: Place.find(1)
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/ka_n_spray/12h/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/ka_n_spray/12h/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/ka_n_spray/12h/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(3),
  extermination_type: ExterminationType.find(2),
  place: Place.find(1)
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/go_aerosol/muender/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/go_aerosol/muender/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/go_aerosol/muender/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(4),
  extermination_type: ExterminationType.find(2),
  place: Place.find(1)
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/go_combat/combat/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/go_combat/combat/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/go_combat/combat/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(4),
  extermination_type: ExterminationType.find(2),
  place: Place.find(1)
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/dani_n_spray/spray/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/dani_n_spray/spray/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/dani_n_spray/spray/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(5),
  extermination_type: ExterminationType.find(2),
  place: Place.find(1)
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/dani_n_sheet/sheet/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/dani_n_sheet/sheet/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/dani_n_sheet/sheet/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(5),
  extermination_type: ExterminationType.find(2),
  place: Place.find(1)
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/dani_konners/beads/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/dani_konners/beads/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/dani_konners/beads/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(5),
  extermination_type: ExterminationType.find(2),
  place: Place.find(1)
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/mukade/mukade_kinchol/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/mukade/mukade_kinchol/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/mukade/mukade_kinchol/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(6),
  extermination_type: ExterminationType.find(1),
  place: Place.find(1)
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/mukade/muender/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/mukade/muender/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/mukade/muender/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(6),
  extermination_type: ExterminationType.find(2),
  place: Place.find(1)
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/insecticide/mukade/mukade_hunter/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/insecticide/mukade/mukade_hunter/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/insecticide/mukade/mukade_hunter/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(6),
  extermination_type: ExterminationType.find(2),
  place: Place.find(1)
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/housewares/gongon/closet/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/housewares/gongon/closet/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/housewares/gongon/closet/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(7),
  extermination_type: ExterminationType.find(2),
  place: Place.find(9)
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/housewares/gongon/walk_in_closet/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/housewares/gongon/walk_in_closet/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/housewares/gongon/walk_in_closet/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(7),
  extermination_type: ExterminationType.find(2),
  place: Place.find(9)
)
Tool.create(
  url: "https://www.kincho.co.jp/seihin/housewares/gongon_aroma/closet_aroma/index.html",
  name: desassembly("https://www.kincho.co.jp/seihin/housewares/gongon_aroma/closet_aroma/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.kincho.co.jp/seihin/housewares/gongon_aroma/closet_aroma/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(7),
  extermination_type: ExterminationType.find(2),
  place: Place.find(9)
)
Tool.create(
  url: "https://www.earth.jp/products/nomat-60-skyblue/index.html",
  name: desassembly("https://www.earth.jp/products/nomat-60-skyblue/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/nomat-60-skyblue/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(2),
  extermination_type: ExterminationType.find(2),
  place: Place.find(1)
)
Tool.create(
  url: "https://www.earth.jp/products/nomat-60-skyblue/index.html",
  name: desassembly("https://www.earth.jp/products/nomat-60-skyblue/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/nomat-60-skyblue/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(3),
  extermination_type: ExterminationType.find(2),
  place: Place.find(1)
)
Tool.create(
  url: "https://www.earth.jp/products/earth-jet-450/index.html",
  name: desassembly("https://www.earth.jp/products/earth-jet-450/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/earth-jet-450/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(2),
  extermination_type: ExterminationType.find(1),
  place: Place.find(1)
)
Tool.create(
  url: "https://www.earth.jp/products/earth-jet-450/index.html",
  name: desassembly("https://www.earth.jp/products/earth-jet-450/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/earth-jet-450/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(3),
  extermination_type: ExterminationType.find(1),
  place: Place.find(1)
)
Tool.create(
  url: "https://www.earth.jp/products/kobae-hoihoi/index.html",
  name: desassembly("https://www.earth.jp/products/kobae-hoihoi/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/kobae-hoihoi/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(3),
  extermination_type: ExterminationType.find(1),
  place: Place.find(4)
)
Tool.create(
  url: "https://www.earth.jp/products/goki-jet-pro-otc-450/index.html",
  name: desassembly("https://www.earth.jp/products/goki-jet-pro-otc-450/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/goki-jet-pro-otc-450/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(4),
  extermination_type: ExterminationType.find(1),
  place: Place.find(1)
)
Tool.create(
  url: "https://www.earth.jp/products/goki-jet-pro-450/index.html",
  name: desassembly("https://www.earth.jp/products/goki-jet-pro-450/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/goki-jet-pro-450/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(4),
  extermination_type: ExterminationType.find(1),
  place: Place.find(1)
)
Tool.create(
  url: "https://www.earth.jp/products/black-cap/index.html",
  name: desassembly("https://www.earth.jp/products/black-cap/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/black-cap/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(4),
  extermination_type: ExterminationType.find(2),
  place: Place.find(1)
)
Tool.create(
  url: "https://www.earth.jp/products/black-cap-sukima/index.html",
  name: desassembly("https://www.earth.jp/products/black-cap-sukima/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/black-cap-sukima/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(4),
  extermination_type: ExterminationType.find(2),
  place: Place.find(1)
)
Tool.create(
  url: "https://www.earth.jp/products/black-cap-okugai/index.html",
  name: desassembly("https://www.earth.jp/products/black-cap-okugai/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/black-cap-okugai/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(4),
  extermination_type: ExterminationType.find(2),
  place: Place.find(6)
)
Tool.create(
  url: "https://www.earth.jp/products/black-cap-okugai/index.html",
  name: desassembly("https://www.earth.jp/products/black-cap-okugai/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/black-cap-okugai/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(4),
  extermination_type: ExterminationType.find(2),
  place: Place.find(7)
)
Tool.create(
  url: "https://www.earth.jp/products/goki-hoihoi/index.html",
  name: desassembly("https://www.earth.jp/products/goki-hoihoi/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/goki-hoihoi/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(4),
  extermination_type: ExterminationType.find(1),
  place: Place.find(1)
)
Tool.create(
  url: "https://www.earth.jp/products/earth-red-6-8/index.html",
  name: desassembly("https://www.earth.jp/products/earth-red-6-8/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/earth-red-6-8/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(4),
  extermination_type: ExterminationType.find(2),
  place: Place.find(1)
)
Tool.create(
  url: "https://www.earth.jp/products/earth-red-nonsmoke-6-8/index.html",
  name: desassembly("https://www.earth.jp/products/earth-red-nonsmoke-6-8/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/earth-red-nonsmoke-6-8/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(4),
  extermination_type: ExterminationType.find(2),
  place: Place.find(1)
)
Tool.create(
  url: "https://www.earth.jp/products/dani-earth-300/index.html",
  name: desassembly("https://www.earth.jp/products/dani-earth-300/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/dani-earth-300/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(5),
  extermination_type: ExterminationType.find(2),
  place: Place.find(1)
)
Tool.create(
  url: "https://www.earth.jp/products/earth-red-dani-6-8/index.html",
  name: desassembly("https://www.earth.jp/products/earth-red-dani-6-8/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/earth-red-dani-6-8/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(5),
  extermination_type: ExterminationType.find(2),
  place: Place.find(1)
)
Tool.create(
  url: "https://www.earth.jp/products/earth-red-dani-nonsmoke-6-8/index.html",
  name: desassembly("https://www.earth.jp/products/earth-red-dani-nonsmoke-6-8/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/earth-red-dani-nonsmoke-6-8/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(5),
  extermination_type: ExterminationType.find(2),
  place: Place.find(1)
)
Tool.create(
  url: "https://www.earth.jp/products/dani-hoihoi/index.html",
  name: desassembly("https://www.earth.jp/products/dani-hoihoi/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/dani-hoihoi/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(5),
  extermination_type: ExterminationType.find(1),
  place: Place.find(1)
)
Tool.create(
  url: "https://www.earth.jp/products/mukadekorori-spray-250/index.html",
  name: desassembly("https://www.earth.jp/products/mukadekorori-spray-250/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/mukadekorori-spray-250/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(6),
  extermination_type: ExterminationType.find(1),
  place: Place.find(1)
)
Tool.create(
  url: "https://www.earth.jp/products/mukadekorori-baits/index.html",
  name: desassembly("https://www.earth.jp/products/mukadekorori-baits/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/mukadekorori-baits/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(6),
  extermination_type: ExterminationType.find(1),
  place: Place.find(6)
)
Tool.create(
  url: "https://www.earth.jp/products/mukadekorori-baits/index.html",
  name: desassembly("https://www.earth.jp/products/mukadekorori-baits/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/mukadekorori-baits/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(6),
  extermination_type: ExterminationType.find(1),
  place: Place.find(7)
)
Tool.create(
  url: "https://www.earth.jp/products/earth-garden-gekimetsu-trap-mukade-2/index.html",
  name: desassembly("https://www.earth.jp/products/earth-garden-gekimetsu-trap-mukade-2/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/earth-garden-gekimetsu-trap-mukade-2/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(6),
  extermination_type: ExterminationType.find(1),
  place: Place.find(1)
)
Tool.create(
  url: "https://www.earth.jp/pest-control/centipede/powder/index.html",
  name: desassembly("https://www.earth.jp/pest-control/centipede/powder/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/mukadekorori-powder-550/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(6),
  extermination_type: ExterminationType.find(1),
  place: Place.find(1)
)
Tool.create(
  url: "https://www.earth.jp/products/pirepara-hikidashi-ff/index.html",
  name: desassembly("https://www.earth.jp/products/pirepara-hikidashi-ff/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/pirepara-hikidashi-ff/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(7),
  extermination_type: ExterminationType.find(2),
  place: Place.find(9)
)
Tool.create(
  url: "https://www.earth.jp/products/pirepara-magic-push-ff/index.html",
  name: desassembly("https://www.earth.jp/products/pirepara-magic-push-ff/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/pirepara-magic-push-ff/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(7),
  extermination_type: ExterminationType.find(2),
  place: Place.find(9)
)
Tool.create(
  url: "https://www.earth.jp/products/pirepara-boutyuuriki-floralsoap/index.html",
  name: desassembly("https://www.earth.jp/products/pirepara-boutyuuriki-floralsoap/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/pirepara-boutyuuriki-floralsoap/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(7),
  extermination_type: ExterminationType.find(2),
  place: Place.find(9)
)
Tool.create(
  url: "https://www.earth.jp/products/kobae-hoihoi-slim/index.html",
  name: desassembly("https://www.earth.jp/products/kobae-hoihoi-slim/index.html").css('//meta[property="og:title"]/@content').to_s,
  image:desassembly("https://www.earth.jp/products/kobae-hoihoi-slim/index.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(3),
  extermination_type: ExterminationType.find(1),
  place: Place.find(4)
)

Countermeasure.create(
  title: "窓・あみ戸の防虫",
  body: "窓の近くは虫が入りやすい場所です。換気のために窓を開けたり、隙間があったりすると、小さな虫は難なく入り込めます。窓を開けることの多い夏は特に注意が必要です。予防には、窓・あみ戸用のスプレー剤を活用しましょう。あみ戸用の設置型虫よけ剤もおすすめです。それぞれの虫に適した専用の駆除剤も効果的です。",
  image: desassembly("https://www.irasutoya.com/2017/09/blog-post_88.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(1),
  extermination_type: ExterminationType.find(2),
  place: Place.find(2)
)
Countermeasure.create(
  title: "玄関の防虫",
  body: "玄関では、人の出入りが多かったり、外出した時に服や鞄などに虫が付いていて知らずに持ち込んでしまったりします。害虫をまとめて予防したい方には設置・スプレーするだけで、まとめて予防＆殺虫できるアイテムが便利です。",
  image: desassembly("https://www.irasutoya.com/2018/09/blog-post_0.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(1),
  extermination_type: ExterminationType.find(2),
  place: Place.find(3)
)
Countermeasure.create(
  title: "台所の防虫",
  body: "水分が多い場所では、虫が発生しやすくなってしまいます。特にヌメリやカビが発生しやすいシンクや排水口、生ゴミが溜まってしまう三角コーナーやゴミ箱には要注意！そこがコバエなどの発生源になってしまうこともあるのです。まずは普段から掃除し、こまめにゴミを捨てるよう心がけてください。
  食べ物を扱うので殺虫成分はできるだけ避けたい、という方には殺虫成分の入っていない駆除剤がおすすめ。ただし発生した虫や入り込んでしまった虫には、速効性のあるスプレー剤などで駆除しましょう。",
  image: desassembly("https://www.irasutoya.com/2014/08/blog-post_754.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(3),
  extermination_type: ExterminationType.find(1),
  place: Place.find(4)
)
Countermeasure.create(
  title: "トイレの防虫",
  body: "水回りの中でも汚れやすいトイレは、虫が好んでやってくる場所でもあります。まずは発生源となるトイレのタンクや便器をキレイに保つことに気を配りましょう。見つけた虫は、できるだけその場で駆除しましょう！",
  image: desassembly("https://www.irasutoya.com/2018/07/blog-post_75.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(3),
  extermination_type: ExterminationType.find(2),
  place: Place.find(5)
)
Countermeasure.create(
  title: "庭の防虫",
  body: "家の周りにある水溜まりや植木鉢の下、落ち葉が溜まっている場所などで虫が発生しやすくなります。家に近い場所はこまめに掃除をして、虫の発生源となる場所を減らすようにしましょう。クモやアリ、ムカデなど、這って侵入してくる虫には、家の中に入らないように耐水性がある粉剤の使用がおすすめです。家屋内への侵入防止にすぐれた効果を発揮します。粉剤がまきにくい場所では、スプレータイプが便利です。",
  image: desassembly("https://www.irasutoya.com/2016/01/blog-post_65.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(6),
  extermination_type: ExterminationType.find(1),
  place: Place.find(6)
)
Countermeasure.create(
  title: "お風呂の防虫",
  body: "お風呂でよく見かけるハート型の「チョウバエ」はヘドロを好むので、こまめにお風呂を掃除して発生させないようにすることが重要です。もしも銀色で素早く動き回る虫をみかけたら、シミ（紙魚）の可能性が大。お風呂場でみかけた虫は、駆除剤を使ってその場で駆除するようにしましょう。",
  image: desassembly("https://www.irasutoya.com/2013/07/blog-post_5543.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(3),
  extermination_type: ExterminationType.find(1),
  place: Place.find(8)
)
Countermeasure.create(
  title: "ベランダの防虫",
  body: "換気のために窓を開けたりすることの多いベランダは、家の中に虫が入ってきてしまうことが多い場所の一つ。普段から不快な害虫たちを予防するために、設置型タイプやあみ戸用の虫よけ剤を活用しましょう。それぞれの虫に適した専用の駆除剤や、忌避・殺虫効果のあるスプレー剤も効果的です。",
  image: desassembly("https://www.irasutoya.com/2020/06/blog-post_202.html").css('//meta[property="og:image"]/@content').to_s,
  insect_type: InsectType.find(1),
  extermination_type: ExterminationType.find(2),
  place: Place.find(7)
)
