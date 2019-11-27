class BloggersController < ApplicationController
    def show
        @blogger=Blogger.find(params[:id])
    end 

    def new
        @blogger=Blogger.new
    end

    def create
        @blogger=Blogger.new(blogger_params)
        if @blogger.save
            redirect_to blogger_path
        else
            redirect_to new_blogger_path
        end 
    end


    private
    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end 
end 
