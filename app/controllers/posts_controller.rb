class PostsController < ApplicationController

    def new
        @post=Post.new
    end 

    def create 
        @post=Post.new(post_params)
        if @post.save 
            redirect_to post_path
        else
            redirect_to new_post_path
        end
    end 

    def show 
        @post=Post.find(params[:id])
    end 

    def edit
        @post=Post.find(params[:id])
    end 

    def update
        @post=Post.find(params[:id])
        if @post.update(post_params)
            redirect_to post_path(@post.id)
        else
            redirect_to edit_post_path(@post.id)
        end 
    end 

    def likes 
        @post=Post.find(params[:id])

        @post.likes+=1
        @post.save 
        redirect_to post_path(@post.id)
    end


    private
    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :desination_id)
    end

end
