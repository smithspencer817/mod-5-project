class Question < ApplicationRecord
  belongs_to :questioner, class_name: "User", foreign_key: :questioner_id
  belongs_to :answerer, class_name: "User", foreign_key: :answerer_id
  has_many :answers

  validates :text, presence: true, length: { maximum: 280, too_long: "%{count} characters is the maximum allowed" }
  validates :questioner, presence: true
  validates :answerer, presence: true
end
