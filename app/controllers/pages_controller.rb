class PagesController < ApplicationController
  skip_before_action :require_login

  def privacy
  end

  def rules
  end

  def content
    @tool = Tool.all
  end
end
