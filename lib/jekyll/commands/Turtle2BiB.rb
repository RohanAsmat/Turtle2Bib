module Jekyll
  module Commands
    class Turtle2BiB < Command
      class << self
        def init_with_program(prog)
          prog.command(:turtle2BiB) do |c|
            c.action do |args, options|
              #Logging and input from the user
              Jekyll.logger.info "Turtle2BiB Parser Version 1.0"
              Jekyll.logger.info "This is a terminal based utility to convert the publication entries in \nthe Turtle file to Bib"
              Jekyll.logger.info "\n \nPlease enter the Turtle(ttl) file path relative to your main Jekyll project directory:"
              parentPath = Dir.pwd
              bibPath = '/rdf-data/sda.bib'
              extension = ''
              extension = gets.chomp
              turtleFilePath = File.join(parentPath, extension)
              bibFilePath = File.join(parentPath, bibPath)

              #Declaration of the Global Variables
              lineParser = Array.new
              readingPublication = false
              countPublication = 0
              publicationCheck = nil
              resourceIdentifier = "sdapublication:"
              #Reading the turtle file and parsing the content to write
              #in the newly created BibFile
                  File.open(turtleFilePath, "r") do |f|
                    f.each_line do |line|
                      lineParser = line.split
                      publicationCheck = lineParser[0]

                      #Reading the further Lines of the Publication Entry
                      if readingPublication == true
                        #Write the entities of the Publication Entry to Bib
                        if lineParser[0] == "dc:title"

                        elsif lineParser[0] == "dc:date"

                        elsif lineParser[0] == "bibo:pages"
                          
                        elsif lineParser[0] == "dc:publisher"

                        elsif lineParser[0] == "foaf:Organization"

                        elsif lineParser[0] == "dc:author"

                        else

                        end

                        if( lineParser.last == "." )
                          #last line of the Publication Entry
                          readingPublication = false
                          puts line
                        end
                      end

                       if line =~ /sdapublication:/
                         #puts "Found root: #{line}"
                         #Reading the first line of the Publication Enrty
                         if ( lineParser[1] == "a" ) && ( lineParser[3] == ";" ) && ( publicationCheck.include? resourceIdentifier )
                           if ( lineParser[2] == "bibo:Article")
                             readingPublication = true
                             countPublication = countPublication + 1
                             puts lineParser
                           end
                         end
                       end

                    end
                    if countPublication == 0
                      puts "No publication found in the Turtle File."
                    end
                  end
            end
          end
        end
      end
    end
  end
end
