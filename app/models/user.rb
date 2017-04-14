require 'bcrypt'

class User < ActiveRecord::Base
  has_many :scores
  #how to get user.questions
  has_many :questions, through: :scores, source: Question
  include BCrypt

  # same as null false in migrations
  validates :email, :password_hash, presence: true, uniqueness: true # if this isn't true active rocord creates and errors hash

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  #create authenticate method
  def authenticate(user_password) # password comes from bcrypt as a parameter
    if self.password == user_password #compares
      #return self
      return "yo james!"
    else
      return nil
    end
  end

end
