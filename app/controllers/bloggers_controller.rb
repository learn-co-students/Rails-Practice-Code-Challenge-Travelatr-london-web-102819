class BloggersController < ApplicationController
  def index
    @bloggers = Blogger.all
  end

  def show
    @blogger = Blogger.find(params[:id])
  end

  def new
    @blogger = Blogger.new
  end

  def create
    blogger = Blogger.create(blogger_params)
    if blogger.save
      redirect_to blogger
    else
      redirect_to new_blogger_path
    end
  end

  def edit
    @blogger = Blogger.find(params[:id])
  end

  def update
    @blogger = Blogger.find(params[:d])
    @blogger.update(blogger_params)

    if @blogger.save
      redirect_to @blogger
    else
      render :edit
    end
  end

  private

  def blogger_params
    params.require(:blogger).permit(:name, :bio, :age)
  end
end
