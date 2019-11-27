class Blogger < ApplicationRecord
    
    has_many :posts
    has_many :destinations, through: :posts

    validates :bio, length: { minimum: 30 }
    validates :age, length: { minimum: 0 }
    validates :name, uniqueness: true


    def total_likes
        like_array = self.posts.map{|post|post.likes}
        like_array.inject(0){|sum,x| sum + x }
    end

    def featured_post
        best_post = self.posts.max_by{|post|post.likes}
    end

end
