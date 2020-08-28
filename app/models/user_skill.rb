class UserSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  has_many :reviews, :dependent => :destroy

  validates :user, presence: true
  validates :skill, presence: true
end
