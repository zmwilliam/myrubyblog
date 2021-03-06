class PostsController < ApplicationController
  def index
    @q = Post.search(params[:q])
    @posts = @q.result(distinct:true)
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to posts_path, :notice => "Post saved"
    else
      render new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to post_path, :notice => "Post updated"
    else
      render edit
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = AdminUser.all
    @comment = Comment.new(:post => @post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice => "Post delet"
  end

end
