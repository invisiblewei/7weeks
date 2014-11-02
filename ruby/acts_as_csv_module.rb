#!/usr/bin/ruby
module ActsAsCsv
    def self.included(base)
        base.extend ClassMethods
    end

    module ClassMethods
        def acts_as_csv
            include InstanceMethods
        end
    end
    module InstanceMethods
        class CsvRow
            def initialize(r,h)
                @row = r
                @headers = h
            end
            def method_missing name, *args
                col = name.to_s
                i = @headers.find_index col
                @row[i]
            end
        end
        def read
            @csv_contents = []
            file = File.new(self.class.to_s.downcase + '.txt')
            @headers = file.gets.chomp.split(',')

            file.each do |row|
                @csv_contents <<row.chomp.split(',')
            end
        end
        
        def each(&block) 
            @csv_contents.each {|r| block.call CsvRow.new(r,@headers)}
        end

        attr_accessor :headers, :csv_contents

        def initialize
            read
        end
    end
end

class RubyCsv
    include ActsAsCsv
    acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
m.each {|row| puts row.b}