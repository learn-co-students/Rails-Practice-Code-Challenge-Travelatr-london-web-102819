class PostsController < ApplicationController

    def show
        @post = Post.find(params[:id])
    end

    def like
        @post = Post.find(params[:id])
        puts 'yes'
        
        @post.likes = 0 if !@post.likes
        @post.likes += 1
        @post.save

        redirect_to post_path(@post)
    end

    def new
        @post = Post.new
    end

    def create
        
        @post = Post.create(post_params)
        
        if @post.save
            redirect_to post_path(@post)
        else
            redirect_to new_post_path
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update

        @post = Post.find(params[:id])

        if @post.update(post_params)
            redirect_to post_path(@post)
        else
            redirect_to edit_post_path
        end

    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
    end


end
