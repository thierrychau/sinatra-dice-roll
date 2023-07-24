# /dice.rb

require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:elephant)
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  erb(:two_six, { :layout => :wrapper })
end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die

  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  erb(:two_ten, { :layout => :wrapper })
end

get("/dice/1/20") do
  first_die = rand(1..20)

  @outcome = "You rolled a #{first_die}."

  erb(:one_twenty, { :layout => :wrapper })
end

get("/dice/5/4") do
  die_faces = 4
  first_die = rand(1..die_faces)
  second_die = rand(1..die_faces)
  third_die = rand(1..die_faces)
  fourth_die = rand(1..die_faces)
  fifth_die = rand(1..die_faces)
  sum = first_die + second_die + third_die + fourth_die + fifth_die

  @outcome = "You rolled [#{first_die}, #{second_die}, #{third_die}, #{fourth_die}, #{fifth_die}] for a total of #{sum}."

  erb(:five_four, { :layout => :wrapper })
end
