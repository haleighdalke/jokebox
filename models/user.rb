class User < ActiveRecord::Base
    has_many :jokes
    has_many :ratings
    # has_many :topics, through: :jokes


    # ----- CRUD -----

    # prompts user for joke & topic and confirms to save
    def create_joke
        # prompt user for a joke & topic
        new_joke_text = CLI.prompt("Please enter your joke:")

        puts "\nType in your joke topic or create one!\n\n"
        Topic.print_top_five_topics
        topic = CLI.prompt
        binding.pry
        # find topic from all topics & create a new joke
        topic = Topic.find_or_create_by(topic: topic)
        new_joke = Joke.new(joke: new_joke_text, topic: topic, user: self)

        # send joke back, ask if they want to make changes or save?
        input = ""
        until input == "Y" || input == "N" do             
            input = CLI.prompt("\nYour joke is: #{new_joke.joke}\nJoke topic is: #{new_joke.topic.topic}\nWould you like to save this joke? (Y/N)")
            if input == "Y"
                new_joke.save
                puts "\nThanks! Your joke has been saved.\n\n"
            elsif input == "N"
                puts "\nYour joke has not been saved.\n\n"
            else
                puts "\nInvalid command. Please try again.\n\n"
            end
        end
    end

    # finds joke and prompts for edits if found
    def edit_joke
        joke = find_my_joke
        if joke
            new_joke = CLI.prompt("Please enter your joke with changes:")
            joke.update(joke: new_joke)
            puts "\nThanks! We've updated your joke!\n\n"
        else
            puts "\nSorry, we can't find your joke!\n\n"
        end
    end

    # finds joke and deletes if found
    def delete_joke
        joke = find_my_joke
        if joke
            joke.delete
            puts "\nThanks! Your joke has been deleted.\n\n"
        else
            puts "\nSorry, we can't find your joke!\n\n"
        end
    end

    # prints my jokes, asks & searches, returns joke or nil (if not found)
    def find_my_joke
        print_my_jokes
        search_for_joke
    end


    # ----- EXTRA METHODS -----

    # rate random joke
    def rate_a_random_joke
        joke = Joke.all.sample
        puts "\n'#{joke.joke}'"
        input = CLI.prompt("Please rate this joke (Score 1-5):").to_i

        if (1..5).include?(input)
            score = input
            Rating.create(user: self, joke: joke, score: score)
            puts "\nThank you for your rating!\n\n"
        else
            puts "\nInvalid command. Please try again.\n\n"
        end
    end
    

    # ----- USER CLASS METHODS -----

    # prompt for new user sign up
    def self.sign_up
        name = CLI.prompt("To start, we need your name:")
        age = CLI.prompt("...and now your age (don't lie):").to_i
        location = CLI.prompt("Lastly let's get your current location:")

        @current_user = User.create(name: name, age: age, location: location)

        puts "\nYay! Let's get you started #{name} from #{location} who's definitely not #{age}!\n\n"
        @current_user
    end

    # pompt for user name, search for first instance of that name, if name doesn't exit then sign up the user
    def self.log_in 
        name = CLI.prompt("Great! What is your name?")
        @current_user = User.all.find_by(name: name)
        if @current_user
        puts "\nWelcome back, #{@current_user.name}! Let's get you started.\n\n"
        else 
        puts "\nUnfortunately, we could not find you in our system. Let's sign you up.\n\n"
        self.sign_up
        end
        @current_user
    end

    # prints list of users
    def self.print_users(user_list)
        user_list.select do |user|
            puts "#{user_list.index(user) + 1}. #{user.name}"
        end
        puts "\n"
    end

    # order users by number of jokes submitted (descending)
    def self.top_users
        User.all.sort_by { |user| user.jokes.length }.reverse!
    end

    # returns top 5 users by amount of jokes submitted
    def self.print_top_five_users
        puts "The top 5 Users are:"
        print_users(top_users[0..4])
    end

    # ----- HELPER INSTANCE METHODS -----

    # returns that joke instance or nil
    def search_for_joke
        joke = CLI.prompt("Please enter the whole joke you're looking for:")
        Joke.find_by(joke: joke, user: self)
    end

    # prints out all jokes associated with this instance
    def print_my_jokes
        jokes = Joke.where(user: self)
        puts "\nYour jokes are:"
        jokes.each do |joke|
            puts "- #{joke.joke}"
        end
        puts "\n"
    end

end