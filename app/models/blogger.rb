class Blogger < ApplicationRecord

    has_many :posts
    has_many :destinations, through: :posts

    validates :name, presence: true, uniqueness: true
    validates :bio, presence: true, length: {minimum: 30}
    validates :age, numericality: {greater_than: 0}

    def featured_post
        self.posts.order(likes: :desc).limit(1).to_a.first
    end

    def total_likes
        if !self.posts.empty?
            self.posts.sum(:likes)
        else
            return 0
        end
    end

    def top_five_destinations
        self.destinations.group(:name).order("COUNT(*) DESC").limit(5).to_a
    end

end
