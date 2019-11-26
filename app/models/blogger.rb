class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates :name, presence: true
  validates :bio, presence: true
  validates :name, uniqueness: true
  validates :age, numericality: { greater_than: 0 }
  validates :bio, length: { minimum: 30 }

  def total_likes
    # likes_number = 0
    # self.posts.each { |p|
    #   likes_number += p.likes.to_i
    # }
    # likes_number
    self.posts.sum(:likes)
  end

  def featured_post
    # most_likes = 0
    # the_post = nil
    # self.posts.each { |p|
    #   if p.likes.to_i > most_likes
    #     most_likes = p.likes
    #     the_post = p
    #   end
    # }
    # the_post

    self.posts.max_by { |p| p.likes }
  end

  def top_5_destinations
    dests = self.posts.group_by do |post|
      post.destination
    end

    sorted = dests.sort_by do |dest, posts|
      posts.length
    end.reverse

    sorted.map do |dest|
      dest[0]
    end[0..4]
  end
end
