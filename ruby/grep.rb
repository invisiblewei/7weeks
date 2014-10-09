#!/usr/bin/ruby
reg = Regexp.new(ARGV[0])
filename = ARGV[1]

counter = 1
File.open(filename,"r") do |f|
    f.each_line do |line|
        puts "#{counter}: #{line}" if line =~ reg
        counter += 1
    end
end
