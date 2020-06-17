class Topic < ActiveRecord::Base
    has_many :jokes

    def self.print_all_topics
        all.select do |topic|
            puts "- #{topic.topic}"
        end
        puts "\n"
    end
end