class DestinationsController < ApplicationController
  
  def show
    @destination = Destination.find(params[:id])
    @last_posts = @destination.five_last_posts
    @featured_post = @destination.featured_post
    @average_age = @destination.average_age
  end

end
