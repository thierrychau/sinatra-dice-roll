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
  "<h1>Dice Roll</h1>
  <ul>
  <li><a href='/dice/2/6'>Roll two 6-sided dice</a></li>
  <li><a href='/dice/2/10'>Roll two 10-sided dice</a></li>
  <li><a href='/dice/1/20'>Roll one 20-sided dice</a></li>
  <li><a href='/dice/5/4'>Roll five 4-sided dice</a></li>
  <li><a href='/flipacoin'>Flip a coin</a></li>
  </ul>"
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
	
  outcome = "You rolled a #{first_due} and a #{second_die} for a total of #{sum}."
	
  "<h1>2d6</h1>
   <p>#{outcome}</p>"
end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  "<h1>2d10</h1>
  <p>#{outcome}</p>"
end

get("/dice/1/20") do
  first_die = rand(1..20)
  outcome = "You rolled a #{first_die}."

  "<h1>1d20</h1>
  <p>#{outcome}</p>"
end

get("/dice/5/4") do
  die_faces = 4
  first_die = rand(1..die_faces)
  second_die = rand(1..die_faces)
  third_die = rand(1..die_faces)
  fourth_die = rand(1..die_faces)
  fifth_die = rand(1..die_faces)
  sum = first_die + second_die + third_die + fourth_die + fifth_die
  outcome = "You rolled [#{first_die}, #{second_die}, #{third_die}, #{fourth_die}, #{fifth_die}] for a total of #{sum}."

  "<h1>5d4</h1>
  <p>#{outcome}</p>"
end

get("/flipacoin") do
  flip = rand(1..2)
  if flip == 1
    head_tail = "head"
  elsif flip == 2
    head_tail = "tail"
  end

  outcome = "You've got #{head_tail}"

  "<h1>Flip a coin</h1>
  <p>#{outcome}</p>"
end
