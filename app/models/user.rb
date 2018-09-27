class User < ApplicationRecord
    has_many :blog_posts, dependent: :destroy
    validates :name, length: { maximum: 45 }, presence: true
    validates :email, length: { maximum: 45 }, presence: true
end
