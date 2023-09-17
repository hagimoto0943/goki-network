class PagesController < ApplicationController
  skip_before_action :require_login, only: %i[privacy rules]

  def privacy
  end

  def rules
  end

  def content
    @tools = Tool.all
    @countermeasures = Countermeasure.all
    @resources = {tool: @tools, countermeasure: @countermeasures, local_path: "http://localhost:3000/posts", product_path: "https://gokinet.org/posts" }
  end

  def explanation
  end

end
