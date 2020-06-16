class User < ActiveRecord::Base
    has_many :jokes
    has_many :ratings
    # has_many :topics, through: :jokes

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
        # binding.pry
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

    # finds joke and prompts for edits if found
    def edit_joke
        joke = find_my_joke
        if joke
            puts "Please enter your joke with changes:"
            new_joke = gets.chomp
            joke.update(joke: new_joke)
            puts "Thanks! We've updated your joke!"
        else
            puts "Sorry, we can't find your joke!"
        end
    end

    # finds joke and deletes if found
    def delete_joke
        joke = find_my_joke
        if joke
            joke.delete
            puts "Thanks! Your joke has been deleted."
        else
            puts "Sorry, we can't find your joke!"
        end
    end

    # returns that joke instance or nil
    def search_for_joke
        puts "Please enter the whole joke you're looking for: "
        joke = gets.chomp
        Joke.find_by(joke: joke, user: self)
    end

    # prints out all jokes associated with this instance
    def print_my_jokes
        jokes = Joke.where(user: self)
        puts "Your jokes are:"
        jokes.each do |joke|
            puts joke.joke
        end
    end

    # prints my jokes, asks & searches, returns joke or nil (if not found)
    def find_my_joke
        print_my_jokes
        search_for_joke
    end

    def rate_a_random_joke
        joke = Joke.all.sample
        puts "#{joke.joke}"
        puts "Please rate this joke (Score 1-5):"
        input = gets.chomp
        if (1..5).include?(input.to_i)
            score = input.to_i
            Rating.create(user: self, joke: joke, score: score)
            puts "Thank you for your rating!\n\n"
        else
            puts "Invalid command. Please try again."
        end
    end
end