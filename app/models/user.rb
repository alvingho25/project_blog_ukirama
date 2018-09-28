class User < ApplicationRecord
    has_many :blog_posts, dependent: :destroy
    validates :name, length: { maximum: 45 }, presence: true
    validates :email, length: { maximum: 45 }, presence: true
    validates_presence_of :password, :on => :create
    validates_confirmation_of :password, :allow_blank => true


    has_secure_password
end
