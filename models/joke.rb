class Joke < ActiveRecord::Base
    belongs_to :user
    belongs_to :topic
    has_many :ratings

    def self.joke_of_the_day
        #random joke from all jokes
    end
    
end