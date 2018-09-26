class Post < ApplicationRecord
	validates :title, presence: true
    # title, content, date
    belongs_to :user
    has_many :comments
end
