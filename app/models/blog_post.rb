class BlogPost < ApplicationRecord
  belongs_to :user
  validates :title, length: { maximum: 50 }
  validates :summary, length: { maximum: 150 }
end
