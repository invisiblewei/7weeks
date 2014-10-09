#!/usr/bin/ruby
ans = rand(10)
puts "Guess a number between 0 to 9."
begin
    a = gets().to_i
    puts "You guess #{a}."
    puts "Wrong! try again." if not a == ans
end until ans == a
puts "Right!"

