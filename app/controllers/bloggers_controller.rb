class BloggersController < ApplicationController
    
    def create
        @blogger = Blogger.create(blogger_params(:name, :bio, :age))
        redirect_to blogger_path(@blogger)
    end
  
    def new
        @blogger = Blogger.new
    end

    def index
        @bloggers = Blogger.all
    end
  
    def show
        @blogger = Blogger.find(params[:id])
        @total_likes = @blogger.total_likes
        @featured_post = @blogger.featured_post
    end
  
    def update
        @blogger = Blogger.find(params[:id])
        @blogger.update(blogger_params(:name, :bio, :age))
        redirect_to blogger_path(@blogger)
    end
  
    def destroy
        Blogger.find(params[:id]).destroy
        redirect_to bloggers_path
    end
  
    def edit
        @blogger = Blogger.find(params[:id])
    end

    private

    def blogger_params(*args)
        params.require(:blogger).permit(*args)
    end
end
