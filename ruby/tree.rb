#!/usr/bin/ruby
class Tree
    attr_accessor :children, :node_name
    def initialize(name, children=[])
        if name.class == String
            @children = children
            @node_name = name
        else name.class == Hash
            @node_name = name.first[0]
            @children = []
            unless name.first[1] == {}
                name.first[1].each {|k,v| @children.push Tree.new(Hash[k,v])}
            end
        end
    end

    def visit_all(&block) 
        visit &block
        children.each { |c| c.visit_all &block}
    end

    def visit(&block)
        block.call self
    end
end

ruby_tree = Tree.new("Ruby",
    [Tree.new("Reia"),
        Tree.new("MacRuby")])

a = {'grandpa' => 
    {'dad' => 
        {'child1' => {}, 'child2' => {}},
    'uncle' => 
        {'child3' => {}, 'child4' => {}}
    }}
ruby_tree2 = Tree.new(a)

puts "visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "visiting entrire tree"
ruby_tree.visit_all {|node| puts node.node_name}
ruby_tree2.visit_all {|node| puts node.node_name}
