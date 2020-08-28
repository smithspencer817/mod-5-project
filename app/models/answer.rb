class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :text, presence: true, length: { maximum: 280, too_long: "%{count} characters is the maximum allowed" }
  validates :question, presence: true
  validates :user, presence: true
end
