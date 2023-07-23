class ToolsController < ApplicationController
  def search
    @tool = Tool.new
    if params[:keyword]
      @tools = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
    end
  end

  def create

  end
end
