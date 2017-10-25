module Jekyll
  module Commands
    class Turtle2BiB < Command
      class << self
        def init_with_program(prog)
          prog.command(:turtle2BiB) do |c|
            c.action do |args, options|
              Jekyll.logger.info "Hello!"
              # logo_path = File.join( File.dirname(__FILE__), '/rdf-data/simpsons.ttl' )
              # file = File.open( logo_path )
              parentPath = Dir.pwd
              extension = '/rdf-data/simpsons.ttl'
              turtleFilePath = File.join(parentPath, extension)
              file = File.open( turtleFilePath )
              contents = file.read
              puts contents
            end
          end
        end
      end
    end
  end
end
