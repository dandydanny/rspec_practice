class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :name, uniqueness: true
end
