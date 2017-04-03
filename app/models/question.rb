class Question < ActiveRecord::Base
  has_many :scores
  has_many :answers
end
