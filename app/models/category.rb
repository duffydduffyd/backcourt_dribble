class Category < ActiveRecord::Base
  belongs_to :sports
  has_many :subcategories
  has_many :questions, through: :subcategories, source: Question
end
