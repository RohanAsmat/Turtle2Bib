module Jekyll
  module Commands
    class Turtle2BiB < Command
      class << self
        def init_with_program(prog)
          prog.command(:turtle2BiB) do |c|
            c.action do |args, options|
              Jekyll.logger.info "Turtle2BiB Parser Version 1.0"
              Jekyll.logger.info "This is a terminal based utility to convert the publication entries in \nthe Turtle file to Bib"
              Jekyll.logger.info "\n \nPlease enter the Turtle(ttl) file path relative to your main Jekyll project directory:"

              parentPath = Dir.pwd
              bibPath = '/rdf-data/sda.bib'
              extension = ''
              extension = gets.chomp
              turtleFilePath = File.join(parentPath, extension)
              bibFilePath = File.join(parentPath, bibPath)
              # file = File.open( turtleFilePath )
              # contents = file.read
              # puts contents
                  File.open(turtleFilePath, "r") do |f|
                    f.each_line do |line|
                       if line =~ /sdapublication:/
                         puts "Found root: #{line}"
                         arr = line.split
                         puts arr
                       end
                      # puts line
                    end
                  end
            end
          end
        end
      end
    end
  end
end
