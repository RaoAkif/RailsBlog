class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:author)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    @post.author = current_user
    if @post.save
      redirect_to user_post_path(current_user, @post)
    else
      render :new
    end
  end

  def posts_params
    params.require(:post).permit(:title, :text)
  end
end
