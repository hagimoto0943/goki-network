class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @profile = @post.user.profile
  end

  def new
    @post =  Post.new
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, success: t('.success')
    else
      flash.now[:error] = t('.fail')
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, success: t('.success')
    else
      flash.now[:error] = t('.fail')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy!
    redirect_to posts_path, success: t('.success')
  end

  private

  def set_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :thumbnail, :post_types, :insect_types, :places)
  end
end
