class Comment < ApplicationRecord
  belongs_to :tweet
  acts_as_votable
  validates_presence_of :body
end
