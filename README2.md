# JokeBox - CLI App
A simple CLI CRUD app created with Ruby and ActiveRecord that allows a user to interact with silly jokes!

## Table of Contents
* General Info
* Technologies
* Setup
* Features
* Inspiration
* Contributions

## General Info
This project was created by Haleigh Dalke and Scott Espinsoa for the purpose of learning Ruby and ActiveRecord. Mod1 Final Project at Flatiron School, presented on June 18, 2020.

## Technologies
* Ruby version: 2.6.1
* ActiveRecord
* Sqlite3

## Setup
To run this project, please run the following in your terminal:
```
$ cd ./jokebox     # be sure you're in this file directory
$ bundle install   # install necessary gems
$ rake play        # begin the program
```
You should see a welcome message... happy laughing!

## Features
* Login as new user or returning user
* Select an option from Main Menu 
    - **Create a joke** (prompts for joke setup, punchline, and topic. Prompts to save before returning to main menu)
    - **Discover jokes** (redirects to secondary menu, see below)
    - **Edit a joke** (prompts to search for joke and then allows you to edit the setup, punchline, and topic)
    - **Delete a joke** (prompts to search for joke, then deletes if found)
    - **Quit** (exits program)
* Select an option from secondary **Discover Jokes** Menu
    - **Find jokes by a user** (prompts for username, then returns jokes by user)
    - **Find jokes by topic** (prompts for topic name, then returns jokes by that topic)
    - **Rate a random joke** (provides a random joke and prompts for a rating)
    - **Get top five rated jokes** (sorts jokes by ratings, returns top 5 rated)
    - **Get all jokes** (prompts for a limit number, then returns that many jokes)
    - **Return to main menu** (returns to Main Menu)
* ASCII Art Welcome & Goodbye

## Inspiration
We started with the idea of a fake news app (apropos with our current political climate, right?) and landed on something a little more simple with a goal of keeping it light and making people laugh. Scott came up with the idea of a joke generating app and we built it together from there.

## Contributions
[ ] Haleigh Dalke
[ ] Scott Espinosa
[ ] https://github.com/15Dkatz/official_joke_api

If you want to contribute to our project, please see our CODE_OF_CONDUCT.md file for direction.

## Liscence
Refer to LICENSE file.