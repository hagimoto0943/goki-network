class ToolsController < ApplicationController
  def index
    @tools = RakutenWebService::Ichiba::Item.search(keyword: 'ゴキブリ')
  end

  # def search
  #   @tools = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword]) if params[:keyword]
  #   @default_tools = RakutenWebService::Ichiba::Item.search(keyword: 'ゴキブリ')
  # end
end
