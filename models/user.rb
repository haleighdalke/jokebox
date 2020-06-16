class User < ActiveRecord::Base
    has_many :jokes
    has_many :ratings

    def create_joke
        # prompt user for a joke
        puts "Please enter your joke:"
        new_joke_text = gets.chomp
        puts "What is your joke topic?" #** print available joke topics
        topic = gets.chomp  
            # find topic from all topics
            topic = Topic.find_or_create_by(topic: topic)
        #binding.pry

            new_joke = Joke.new(joke: new_joke_text, topic: topic, user: self)
        # send joke back, ask if they want to make changes or save?
        puts new_joke.joke
        puts "Would you like to save? (Y/N)"
        input = ""
        binding.pry
        until input == "Y" || input == "N" do 
            input = gets.chomp
            if input == "Y"
                new_joke.save
                puts "Thanks! Your joke has been saved."
            elsif input == "N"
                puts "Your joke has not been saved."
                #return to main title
            else
                puts "Invalid command. Please try again."
            end
        end
        # if make changes, repeat joke asking process
        # else save
        # display 'thanks!'
        # return to main title
    end

    def edit_joke
        joke = search_for_joke
        if joke
            puts "Please enter your joke with changes:"
            new_joke = gets.chomp
            joke.update(joke: new_joke)
            puts "Your joke has been successfully updated"
        else
            puts "Sorry, we can't find your joke! Try retyping or choosing a joke that belongs to you."
        end
    end

    def delete_joke
        joke = search_for_joke
        if joke
            joke.delete
        else
            puts "Sorry, we can't find your joke! Try retyping or choosing a joke that belongs to you."
        end
    end

    def search_for_joke
        puts "Please enter the whole joke you're looking for: "
        joke = gets.chomp
        Joke.find_by(joke: joke, user: self) # this ensures the search queries are specific to this user instance
    end
end