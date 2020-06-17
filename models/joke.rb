class Joke < ActiveRecord::Base
    belongs_to :user
    belongs_to :topic
    has_many :ratings

    # ----- CLASS METHODS -----

    def self.print_a_joke(joke)
        puts "'#{joke.setup}'"
        puts "'#{joke.punchline}'"
        puts "-- Submitted by #{joke.user.name}"
    end

    def self.print_a_joke_with_pause(joke)
        puts "'#{joke.setup}'"
        puts "..."
        sleep(3)
        puts "'#{joke.punchline}'"
        puts "-- Submitted by #{joke.user.name}"
    end

    # returns a random joke
    def self.get_random_joke
        Joke.print_a_joke_with_pause(all.sample)
    end
    
    # prints all jokes with user who created them
    def self.print_all_jokes
        input = CLI.prompt("How many jokes do you want to see?")
        puts "\nALL #{input} JOKES:\n\n"
        all.sample(input.to_i).each do |joke|
            Joke.print_a_joke(joke)
            puts "\n"
        end
    end

    # finds and prints jokes by user
    def self.find_jokes_by_user
        User.print_top_five_users
        name = CLI.prompt("Whose jokes are you looking for?")
        user = User.all.find_by(name: name)
        if user 
            user_jokes = self.where(user: user)
            puts "\nHere are some of #{user.name}'s jokes:\n\n"
            user_jokes.sample(10).select do |joke|
                Joke.print_a_joke(joke)
            end
            puts "\n"
        else
            puts "\nSorry! We could not find this user in our system.\n\n"
        end
    end

    # finds and prints jokes by topic
    def self.find_jokes_by_topic
        Topic.print_top_five_topics
        topic = CLI.prompt("What topic are you looking for?")
        topic_name = Topic.all.find_by(topic: topic)
        if topic_name 
            topic_jokes = self.where(topic: topic_name)
            puts "\nHere are some '#{topic_name.topic}' jokes:"
            topic_jokes.sample(10).select do |joke|
                Joke.print_a_joke(joke)
            end
            puts "\n"
        else
            puts "\nSorry! We couldn't find this topic in our system.\n\n"
        end 
    end

    # only stores jokes that have ratings
    def self.only_rated_jokes
        Joke.all.select do |joke|
            joke.ratings.any?
        end
    end

    # returns top 5 rated jokes by average rating
    def self.top_five_rated_jokes
        top_5 = only_rated_jokes.sort_by {|joke| joke.average_rating }.reverse!
        top_5[0..4].select do |joke|
            print "#{top_5.index(joke) + 1}. "
            Joke.print_a_joke(joke)
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
        (total_ratings.to_f / ratings.count).round(2)
    end
end