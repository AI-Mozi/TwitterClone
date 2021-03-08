class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  acts_as_votable
  validates_presence_of :tweet
end
