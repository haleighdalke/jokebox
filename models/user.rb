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
        new_joke = Joke.new(joke: new_joke_text, topic: topic, created_by_user_id: self.id)
        # send joke back, ask if they want to make changes or save?
        binding.pry
        puts new_joke.joke
        puts "Would you like to save? (Y/N)"
        input = gets.chomp
        until input == "Y" || "N" do 
            if input == "Y"
                new_joke.save
                puts "Thanks! Your joke has been saved."
            elsif input == "N"
                puts "Your joke has not been saved."
                #return to main title
            else
                "Invalid command. Please try again."
            end
        end
        # if make changes, repeat joke asking process
        # else save
        # display 'thanks!'
        # return to main title
    end

    def edit_joke(joke)
        puts "Please enter your joke with changes:"
        new_joke = gets.chomp
        joke.update(joke: new_joke)
        puts "Your joke has been successfully updated"
    end

    def delete_joke(joke)
        # find joke
        # if there
            # prompt to delete joke
            # if yes, delete
            # else return to main menu
        # else "cannot find joke"
            # return to main menu
    end
end