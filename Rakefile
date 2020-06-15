require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc "Prints hello world"
task :hello_world do
    puts "Hello World"
end

desc "Starts a console session"
task :console do 
    # ActiveRecord::Base.logger = Logger.new(STDOUT)    
    binding.pry
end

desc "bundle && migrate && seed"
task :setup do 
    sh "bundle"
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:seed"].invoke
end

desc "Start the sorting"
task :play do 
    sh "ruby bin/run.rb"
end