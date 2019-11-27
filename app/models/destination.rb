class Destination < ApplicationRecord

    has_many :posts
    has_many :bloggers, through: :posts
    
    def five_last_posts 
        no_of_posts = self.posts.length
        if no_of_posts < 5 && no_of_posts > 0
            posts = self.posts.last(no_of_posts)
        elsif no_of_posts = 0
            posts = []
        else posts = self.posts.last(5)
        end
        posts
    end

    def featured_post
        self.posts.max_by{|post|post.likes}
    end

    def average_age
        ages = self.bloggers.map{|blogger|blogger.age}
        average = ages.inject{ |sum, el| sum + el }.to_f / ages.size
        average
    end

end
