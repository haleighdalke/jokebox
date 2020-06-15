# Mod 1 Project Outline

## Repo Link
- <Attach github link here>

## Project Idea/Misson
JokeBox provides a fun experience where you can write, rate, discover quick laughs. 

## Domain
User
1. id: integer
2. name: string
3. age: integer
4. location: string

Rating
1. id: integer
2. joke_id: integer
3. rated_by_user_id: integer
4. score: integer

Joke
1. id: integer
2. joke: string
3. created_by_user_id: integer
4. topic_id: integer

Topic
1. id: integer
2. topic: string

## User Story ( At least 4)
1. Create - User can create a joke, create a new user
2. Read - Get all jokes from all users,  joke of the day/random joke
3. Update - user's can edit their own jokes
4. Delete - delete a joke

## Stretch Goals
- Suggestive jokes based on jokes they've rated
- Find joke with this keyword
- Fancy Output - Title Card
- create a topic, create a rating
- jokes by topic, highest rated jokes (10), user's highest rated jokes, get user (and other user's info), popular jokes by age/location/topic, user's favorite topic
- edit their own user information, edit a topic name, edit user's ratings on other user's joke
- delete themselves, delete a rating, delete topic name
