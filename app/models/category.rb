class Category < ActiveRecord::Base
  belongs_to :sports
  has_many :subcategories
  has_many :questions, through:
  has_many :subcategories, source: Question
end
