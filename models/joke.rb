class Joke < ActiveRecord::Base
    belongs_to :user
    belongs_to :topic
    has_many :ratings

    # ----- CLASS METHODS -----

    # returns a random joke
    def self.get_random_joke
        puts "Your joke of the moment is: \n'#{all.sample.joke}'\n\n"
    end
    
    # prints all jokes with user who created them
    def self.print_all_jokes
        puts "\nALL JOKES:\n\n"
        all.each do |joke|
            puts "'#{joke.joke}'"
            puts "-- Submitted by #{joke.user.name} \n\n"
        end
    end

    # finds and prints jokes by user
    def self.find_jokes_by_user
        name = CLI.prompt("Who's jokes are you looking for?")
        user = User.all.find_by(name: name)
        if user 
            user_jokes = self.where(user: user)
            puts "\nHere are #{user.name}'s jokes:"
            user_jokes.select do |joke|
                puts "- #{joke.joke}"
            end
            puts "\n"
        else
            puts "\nSorry! We could not find this user in our system.\n\n"
        end
    end

    # finds and prints jokes by topic
    def self.find_jokes_by_topic
        topic = CLI.prompt("What topic are you looking for?")
        topic_name = Topic.all.find_by(topic: topic)
        if topic_name 
            topic_jokes = self.where(topic: topic_name)
            puts "\nHere are the '#{topic_name.topic}' jokes:"
            topic_jokes.select do |joke|
                puts "- #{joke.joke}"
            end
            puts "\n"
        else
            puts "\nSorry! We could not find this topic in our system.\n\n"
        end 
    end

    def self.only_rated_jokes
        Joke.all.select do |joke|
            joke.ratings.any?
        end
    end

    def self.top_five_rated_jokes
        top_5 = only_rated_jokes.sort_by {|joke| joke.average_rating }.reverse!
        top_5[0..4].select do |joke|
            puts "- #{joke.joke}"
            puts "Average Rating: #{joke.average_rating} \n\n"
        end
    end

    # ----- INSTANCE METHODS -----

    # get average rating of a joke
    def average_rating
        ratings = Rating.where(joke: self)
        total_ratings = ratings.sum do |rating|
            rating.score
        end
        total_ratings.to_f / ratings.count
    end
end