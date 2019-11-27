class Post < ApplicationRecord
    belongs_to :blogger
    belongs_to :destination

    validates :content, length: {minimum: 100, too_short: "%{count} characters is below the minimum required"}
    validates :title, presence: true
    validates :destination_id, presence: true
    validates :blogger_id, presence: true 
    
    
end
