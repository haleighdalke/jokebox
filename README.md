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
- Create a topic
- Create a rating
- Sort jokes by topic, 
- Highest rated jokes by a limit of x
- User's specific highest rated jokes by a limit of x
- Get user (and other user's info)
- Popular jokes by age/location/topic
- User's favorite topic
- User can edit their own user information
- User can edit a topic name
- User can edit user's ratings on other user's joke
- User can delete themselves
- User can delete a rating
- User can delete topic name

- list topics
- cleanup output
- popular jokes by age
- api

### End of Day Check In (June 15)

## What we accomplished
1. Configured run.rb, environment.rb, db, models, gemfiles, rakefile
2. Migrated tables
3. Seeded tables with data
4. Updated a table and re-migrated
5. Built classes & associations for Joke, Rating, Topic, & User
6. Built CLI class
7. Updated run.rb
8. Built MVP CRUD methods
9. Tested for errors (no errors currently)
10. HAD FUN WITH JOKES

## What we were last working on
- delete & edit functions for User

## Questions we have
- How do inform the user on the command line about their library of jokes? Because we've built the search method in a way that limits the user's ability to delete/edit to jokes that they've created
- How can we make the output pretty?
- Should we update the name of rated_by_user_id column in ratings to user_id? Same for joke?
- How can we incorporate API's?

## What we need to do next
- login functionality
- answer questions above ^
- start attacking stretch goals

