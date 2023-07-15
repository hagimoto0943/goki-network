class PostsController < ApplicationController
  def index
    @posts = Post.all.includes(:user).order(created_at: :desc)
  end

  def new
    @post =  Post.new
    @tool =  Tool.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = current_user.posts.find(params[:id])
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
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy!
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :thumbnail, :post_types)
  end
end
