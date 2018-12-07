require 'require_all'
require_relative "../config/environment.rb"
User.destroy_all
Movie.destroy_all




the_dark_knight = Movie.create(title: "The Dark Knight", runtime: 120)
pride_and_prejudice = Movie.create(title: "Pride and Prejudice", runtime: 180)
johnny_english = Movie.create(title: "Johnny English", runtime: 90)
the_two_towers = Movie.create(title: "The Two Towers", runtime: 240)
cleopatra = Movie.create(title: "Cleopatra", runtime: 320)
infinity_war = Movie.create(title: "Infinity War", runtime: 160)
the_lion_king = Movie.create(title: "The Lion King", runtime: 90)
frozen = Movie.create(title: "Frozen", runtime: 120)

rachel_novick = User.create(name: "rachel novick")
jonnel_benjamin = User.create(name: "jonnel benjamin")
brunomon = User.create(name: "brunomon")
george_bush = User.create(name: "george bush")
