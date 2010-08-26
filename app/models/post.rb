class Post < ActiveRecord::Base
  validates_presence_of :title, :body, :author
  validates_uniqueness_of :title
end
