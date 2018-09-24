class User < ApplicationRecord
    # name, email, password
    has_many :posts
    has_many :comments
end

