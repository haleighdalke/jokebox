class Topic < ActiveRecord::Base
    has_many :jokes

    def self.print_topics(topic_list)
        topic_list.select do |topic|
            puts "#{topic_list.index(topic) + 1}. #{topic.topic}"
        end
    end

    def self.top_5_topics
        top_5 = Topic.all.sort_by { |topic| topic.jokes.length }.reverse!
        puts "The top 5 topics are:"
        print_topics(top_5[0..4])
    end
end