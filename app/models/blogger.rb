class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts 
   
    validates :name, uniqueness:true
    validates :bio, length: {minimum: 30, too_short: "%{count} characters is below the minimum required"}
    validates :age, numericality:{greater_than: 0}
    def posts
        #all posts by this blogger
        Post.all.select{|post| post.blogger==self}
    end 

    def post_likes
        #all likes of all posts by this blogger
        self.posts.reduce(0){|sum, post| sum+=post.likes}
    end 

    def most_liked_post
        #the most liked post of this blogger
        self.posts.max_by{|post| post.likes}
    end 

    def top_five_most_written
        # byebug
        self.posts.group_by{|post| post.destination}.sort.take(5)
        #self.posts.group_by(&:destination).sort_by{|d| d.size}
    end 
    
    

   
end
