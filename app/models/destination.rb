class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def most_recent_5
        self.posts.last(5)
    end 

    def most_liked
        self.posts.max_by{|p| p.likes}
    end 

    def age_ave
       total= self.bloggers.reduce(0){|sum, blogger| sum+=blogger.age}
        bloggers=self.bloggers.count 
        age_ave= total/bloggers 
        age_ave 
    end 
end
