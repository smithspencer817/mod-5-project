class User < ApplicationRecord
    
    #Skills
    has_many :user_skills, :dependent => :destroy
    has_many :skills, through: :user_skills

    #Reviews
    has_many :received_reviews, foreign_key: :review_receiver_id, class_name: "Review", :dependent => :destroy
    has_many :review_givers, through: :received_reviews
    has_many :given_reviews, foreign_key: :review_giver_id, class_name: "Review", :dependent => :destroy
    has_many :review_receivers, through: :given_reviews

    #Questions
    has_many :received_questions, foreign_key: :answerer_id, class_name: "Question", :dependent => :destroy
    has_many :questioners, through: :received_questions
    has_many :posed_questions, foreign_key: :questioner_id, class_name: "Question", :dependent => :destroy
    has_many :answerers, through: :posed_questions

    #Answers
    has_many :answers, :dependent => :destroy

    validates :name, presence: true
    validates :username, presence: true, uniqueness: true, length: { 
        in: 6..20,
        message: "%{count} isn't between 6 and 20 characters"
    }
    validates :password, presence: true, uniqueness: true, length: {
        in: 6..20,
        message: "%{count} isn't between 6 and 20 characters"
    }
end
