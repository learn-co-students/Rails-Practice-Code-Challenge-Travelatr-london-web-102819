class Post < ApplicationRecord

    belongs_to :destination
    belongs_to :blogger

    validates :content, presence: true, length: {minimum: 100}
    validates :title, presence: true
    
end
