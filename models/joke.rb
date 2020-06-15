class Joke < ActiveRecord::Base
    belongs_to :user
    belongs_to :topic
    has_many :ratings

    def self.joke_of_the_day
        #random joke from all jokes
        puts "Joke of the day is: \n'#{all.sample.joke}'"
    end
    
    def self.print_all_jokes
        all.each do |joke|
            puts joke.joke
        end
    end

end