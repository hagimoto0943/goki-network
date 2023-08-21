class ToolsController < ApplicationController
  def index
    @tools = RakutenWebService::Ichiba::Item.search(keyword: 'ゴキブリ')
  end
end
