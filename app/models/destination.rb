class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def most_five_recent
        self.posts.order(created_at: :desc).limit(5).pluck(:title).to_a
    end

    def featured_post
        self.posts.order(likes: :desc).limit(1).to_a[0]
    end

    def average_age
        self.bloggers.average(:age).to_i
    end
end
