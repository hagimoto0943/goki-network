class PostsController < ApplicationController
  def index
    @posts = Post.all.includes(:user).order(created_at: :desc)
  end

  def new
    @post =  Post.new
  end

  def show
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def update
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
