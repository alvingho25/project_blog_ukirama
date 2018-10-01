class BlogPost < ApplicationRecord
  belongs_to :user
  acts_as_taggable
  # acts_as_taggable_on :skills
  # has_many :taggings, foreign_key: "post_id"
  # has_many :tags, through: :taggings


  validates :title, length: { maximum: 50 }
  validates :summary, length: { maximum: 150 }

  # def tag_list
  #   tags.join(', ')
  # end

  # def tag_list=(string)
  #   tag_names = string.split(",").collect{|s| s.strip.downcase}.uniq
  #   new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
  #   self.tags = new_or_found_tags
  # end
end
