class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params, likes: 0)

    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      @error = true
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.valid?
      @post.update(post_params)      
      redirect_to post_path(@post)
    else
      @error = true
      render :new
    end

    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def like
    @post = Post.find(params[:id])
    @post.liked
    redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
  end

end
