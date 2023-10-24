module ApplicationHelper
  def page_title(page_title = '')
    base_title = 'Goki.net'
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end
  def default_meta_tags
    {
      site: 'Goki.net',
      title: '虫嫌いのための害虫対策共有サービス',
      reverse: true,
      charset: 'utf-8',
      description: 'Goki.netを使えばむ虫嫌いのあなたでも楽しく害虫対策、予防などができます。',
      keywords: 'ゴキブリ,害虫,害虫対策,ムカデ,コバエ',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'), # 配置するパスやファイル名によって変更すること
        local: 'ja-JP'
      }
    }
  end
end
