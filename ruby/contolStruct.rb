#!/usr/bin/ruby
n = 5
(1..n).each do |i|
    puts "each #{i}"
end

i = 1
while i <=n do
    puts "while1 #{i}"
    i += 1
end

i = 1
begin
    puts "while2 #{i}"
    i += 1
end while i<=n

i = 1
begin
    puts "until #{i}"
    i += 1
end until i>n

for i in 1..n
    puts "for #{i}"
end
