#!/usr/bin/ruby
filename = ARGV[0]

counter = 1
f = File.new(filename,"r")
f.each_line do |line|
    puts "#{counter}: #{line}"
    counter += 1
end

counter = 1
#like with in python
File.open(filename,"r") do |f|
    f.each_line do |line|
        puts "#{counter}: #{line}"
        counter += 1
    end
end
