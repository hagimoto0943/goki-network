class ToolsController < ApplicationController
  def index
    @tools = RakutenWebService::Ichiba::Item.search(keyword: "ゴキブリ")
  end

  def search
    if params[:keyword]
      @tools = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
    end
    @default_tools = RakutenWebService::Ichiba::Item.search(keyword: "ゴキブリ")
  end
end
