class Joke < ActiveRecord::Base
    belongs_to :user
    belongs_to :topic
    has_many :ratings

    def average_rating
        ratings = Rating.where(joke: self)
        total_ratings = ratings.sum do |rating|
            rating.score
        end
        total_ratings.to_f / ratings.count
    end

    def self.get_random_joke
        #random joke from all jokes
        puts "Your joke of the moment is: \n'#{all.sample.joke}'"
    end
    
    def self.print_all_jokes
        all.each do |joke|
            puts joke.joke
            puts "-- Submitted by #{joke.user.name} \n\n"
        end
    end

    def self.find_jokes_by_user
        puts "Who's jokes are you looking for?"
        name = gets.chomp
        user = User.all.find_by(name: name)
        if user 
            user_jokes = self.where(user: user)
            puts "Here are #{user.name}'s jokes:"
            user_jokes.select do |joke|
                puts "- #{joke.joke}"
            end
        else
            puts "Sorry! We could not find this user in our system."
        end
    end

    def self.find_jokes_by_topic
        puts "What topic are you looking for?"
        topic = gets.chomp
        topic_name = Topic.all.find_by(topic: topic)
        if topic_name 
            topic_jokes = self.where(topic: topic_name)
            puts "Here are the '#{topic_name.topic}' jokes:"
            topic_jokes.select do |joke|
                puts "#{joke.joke}"
            end
        else
            puts "Sorry! We could not find this topic in our system."
        end 
    end

    def self.top_five_rated_jokes
        binding.pry
    end
end