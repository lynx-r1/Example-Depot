class Post < ActiveRecord::Base
  validates_presence_of :title, :body, :author
  validates_uniqueness_of :title
  validates_length_of :title, :maximum => 100
  validates_length_of :body, :maximum => 256
end
