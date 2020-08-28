class Review < ApplicationRecord
  belongs_to :review_giver, class_name: "User", foreign_key: :review_giver_id
  belongs_to :review_receiver, class_name: "User", foreign_key: :review_receiver_id
  belongs_to :user_skill

  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: { 
    in: 1..5, message: "%{value} is an invalid rating" 
  }
  validates :review_giver, presence: true
  validates :review_receiver, presence: true
  validates :user_skill, presence: true
end
