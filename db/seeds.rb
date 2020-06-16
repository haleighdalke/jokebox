Joke.destroy_all
User.destroy_all
Rating.destroy_all
Topic.destroy_all

# ----Users-----
user1 = User.create(name: "Scott", age: 21, location: "San Francisco")
user2 = User.create(name: "Haleigh", age: 24, location: "Gilroy")
user3 = User.create(name: "Zana", age: 22, location: "Seattle")

# ----Topics-----
puns = Topic.create(topic: "puns")
dad_jokes = Topic.create(topic: "dad jokes")
flatiron_bootcamp = Topic.create(topic: "flatiron bootcamp")
knock_knock = Topic.create(topic: "knock knock")

# ----Jokes-----

joke1 = Joke.create(joke: "I was wondering why the ball was getting bigger. Then it hit me.", 
    created_by_user_id: user1.id, 
    topic: puns)

joke2 = Joke.create(joke: "I have a few jokes about unemployed people, but none of them work.", 
    created_by_user_id: user2.id, 
    topic: flatiron_bootcamp)

joke3 = Joke.create(joke: "Did you know the first French fries weren't actually cooked in France? They were cooked in Greece.", 
    created_by_user_id: user3.id, 
    topic: dad_jokes)

joke4 = Joke.create(joke: "Knock, knock. Who’s there? Owls say. Owls say who? Yes. Yes, they do.", 
    created_by_user_id: user3.id, 
    topic: knock_knock)

# ----Ratings-----
rating1 = Rating.create(score: 2, joke: joke4, rated_by_user_id: user1.id)
rating2 = Rating.create(score: 5, joke: joke2, rated_by_user_id: user2.id)
rating3 = Rating.create(score: 5, joke: joke1, rated_by_user_id: user1.id)