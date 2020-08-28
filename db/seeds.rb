# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Answer.destroy_all
Question.destroy_all
Review.destroy_all
Skill.destroy_all
UserSkill.destroy_all

# 30.times do 
#     User.create(
#         name: Faker::Name.first_name,
#         username: Faker::Internet.email,
#         password: Faker::Code.imei
#     )
# end

# 10.times do 
#     Skill.create(
#         name: Faker::ProgrammingLanguage.name
#     )
# end

# 100.times do
#     userskill = UserSkill.new
#     userskill.user = User.all.sample
#     userskill.skill = Skill.all.sample
#     userskill.save
# end

# 100.times do 
#     review = Review.new
#     review.rating = (1..10).to_a.sample
#     review.review_giver = User.all.sample
#     review.review_receiver = User.all.sample
#     review.user_skill = UserSkill.all.sample
#     review.save
# end

# 50.times do
#     question = Question.new
#     question.text = Faker::Lorem.sentence
#     question.questioner = User.all.sample
#     question.answerer = User.all.sample
#     question.save
# end

# 50.times do
#     answer = Answer.new
#     answer.text = Faker::Lorem.sentence
#     answer.question = Question.all.sample
#     answer.user = User.all.sample
# end

# Users:

spencer = User.create(name: 'Spencer', username: 'smithspencer817', password: 'password123')
jodi = User.create(name: 'Jodi', username: 'jodi214', password: 'mylifehurts')
james = User.create(name: 'James', username: 'james564', password: 'reactnative')

# Skills:

python = Skill.create(name: 'Python')
javascript = Skill.create(name: 'JavaScript')
ruby = Skill.create(name: 'Ruby')

# UserSkills:

spencerskill1 = UserSkill.new
spencerskill1.user = spencer
spencerskill1.skill = python
spencerskill1.save

spencerskill2 = UserSkill.new
spencerskill2.user = spencer
spencerskill2.skill = javascript
spencerskill2.save

jodiskill1 = UserSkill.new
jodiskill1.user = jodi
jodiskill1.skill = ruby
jodiskill1.save

jodiskill2 = UserSkill.new
jodiskill2.user = jodi
jodiskill2.skill = javascript
jodiskill2.save

jamesskill1 = UserSkill.new
jamesskill1.user = james
jamesskill1.skill = javascript
jamesskill1.save

jamesskill2 = UserSkill.new
jamesskill2.user = james
jamesskill2.skill = ruby
jamesskill2.save

# Reviews:

review1 = Review.new
review1.review_giver = spencer
review1.review_receiver = jodi
review1.rating = 4
review1.user_skill = jodiskill1
review1.save

review2 = Review.new
review2.review_giver = spencer
review2.review_receiver = james
review2.rating = 5
review2.user_skill = jamesskill2
review2.save

review3 = Review.new
review3.review_giver = jodi
review3.review_receiver = james
review3.rating = 2
review3.user_skill = jamesskill2
review3.save

review4 = Review.new
review4.review_giver = james
review4.review_receiver = spencer
review4.rating = 5
review4.user_skill = spencerskill2
review4.save

# Questions:

question1 = Question.new
question1.questioner = james
question1.answerer = spencer
question1.text = 'Why do you like Python?'
question1.save

question2 = Question.new
question2.questioner = james
question2.answerer = jodi
question2.text = 'What is your favorite thing about Ruby?'
question2.save

question3 = Question.new
question3.questioner = spencer
question3.answerer = james
question3.text = 'Why do you use react native?'
question3.save

# Answers:

answer1 = Answer.new
answer1.user = spencer
answer1.question = question1
answer1.text = 'It’s a great programming language for machine learning and data science'
answer1.save

answer2 = Answer.new
answer2.user = jodi
answer2.question = question2
answer2.text = 'It’s a very beginner friendly language, great for bootcamps'
answer2.save

answer3 = Answer.new
answer3.user = james
answer3.question = question3
answer3.text = 'It’s complicated'
answer3.save