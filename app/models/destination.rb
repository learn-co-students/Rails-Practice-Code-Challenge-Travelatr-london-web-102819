class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def most_recent_5
    self.posts.last(5)
  end
end
