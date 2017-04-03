class User < ActiveRecord::Base
  has_many :scores
  #how to get user.questions
  has_many :questions, through: :scores, source: Question
end
