class PostsController < ApplicationController
  def index
    @posts = Post.all.includes(:user).order(created_at: :desc)
  end

  def new
  end

  def show
  end

  def edit
  end

  def create
  end

  def update
  end
end
