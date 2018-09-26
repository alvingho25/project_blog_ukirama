class User < ApplicationRecord
    # has_many :posts, dependent: :destroy
    validates :name, length: { maximum: 45 }
    validates :email, length: { maximum: 45 }
end
