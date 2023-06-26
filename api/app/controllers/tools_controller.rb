class ToolsController < ApplicationController
  def search
    if params[:keyword]
      @tools = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
    end
  end
end
