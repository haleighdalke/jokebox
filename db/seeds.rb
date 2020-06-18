Joke.destroy_all
User.destroy_all
Rating.destroy_all
Topic.destroy_all

file = File.read("./db/index.json")
data = JSON.parse(file)
names = ['Noah', 'Emma', 'Liam', 'Sophia', 'Jacob', 'Olivia', 'Mason', 'Isabella', 'William', 'Ava', 'Ethan', 'Mia', 'Michael', 'Abigail', 'Alexander']

locations = ['San Francisco', 'Seattle', 'New York', 'Dallas', 'Detroit', 'Miami', 'Las Vegas', 'Boston']
#binding.pry

# create topics
data.map do |joke|
    Topic.find_or_create_by(topic: joke["type"])
end

# create users

names.map do |name|
    User.create(name: name, age: rand(13..90), location: locations.sample)
end

# create jokes
data.map do |joke|
    #binding.pry
    Joke.create(topic_id: Topic.find_or_create_by(topic: joke["type"]).id, setup: joke["setup"], punchline: joke["punchline"], user_id: User.all.sample.id)
end

# add random ratings
50.times do
    Rating.create(user: User.all.sample, joke: Joke.all.sample, score: rand(1..5))
end


# # ----Users-----
# user1 = User.create(name: "Scott", age: 21, location: "San Francisco")
# user2 = User.create(name: "Haleigh", age: 24, location: "Gilroy")
# user3 = User.create(name: "Zana", age: 22, location: "Seattle")

# # ----Topics-----
# puns = Topic.create(topic: "puns")
# dad_jokes = Topic.create(topic: "dad jokes")
# flatiron_bootcamp = Topic.create(topic: "flatiron bootcamp")
# knock_knock = Topic.create(topic: "knock knock")

# # ----Jokes-----

# joke1 = Joke.create(joke: "I was wondering why the ball was getting bigger. Then it hit me.", 
#     user: user1, 
#     topic: puns)

# joke2 = Joke.create(joke: "I have a few jokes about unemployed people, but none of them work.", 
#     user: user2, 
#     topic: flatiron_bootcamp)

# joke3 = Joke.create(joke: "Did you know the first French fries weren't actually cooked in France? They were cooked in Greece.", 
#     user: user3, 
#     topic: dad_jokes)

# joke4 = Joke.create(joke: "Knock, knock. Who’s there? Owls say. Owls say who? Yes. Yes, they do.", 
#     user: user3, 
#     topic: knock_knock)

# # ----Ratings-----
# rating1 = Rating.create(score: 2, joke: joke4, user: user1)
# rating2 = Rating.create(score: 5, joke: joke2, user: user2)
# rating3 = Rating.create(score: 5, joke: joke1, user: user1)