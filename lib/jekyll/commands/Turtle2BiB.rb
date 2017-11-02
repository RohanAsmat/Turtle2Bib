module Jekyll
  module Commands
    class Turtle2BiB < Command
      class << self
        def init_with_program(prog)
          prog.command(:turtle2BiB) do |c|
            c.action do |args, options|
              Jekyll.logger.info "Hello!"

              parentPath = Dir.pwd
              # extension = '/rdf-data/simpsons.ttl'
              extension = ''
              extension = gets.chomp
              turtleFilePath = File.join(parentPath, extension)
              # file = File.open( turtleFilePath )
              # contents = file.read
              # puts contents
                  File.open(turtleFilePath) do |f|
                  f.each_line do |line|
                  if line =~ /foaf:Person/
                    puts "Found root: #{line}"
                  end
                  end
                  end
            end
          end
        end
      end
    end
  end
end
