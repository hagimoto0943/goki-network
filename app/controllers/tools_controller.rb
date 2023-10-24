class ToolsController < ApplicationController
  def index
    @tools = RakutenWebService::Ichiba::Item.search(keyword: '害虫対策')
  end
end
