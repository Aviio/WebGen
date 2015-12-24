# Wrapper class for webgen, allows a user to generate a randomised vulnerable website using command line arguments
require_relative 'webgen/xml_reader'
require_relative 'webgen/webgen_engine'
require_relative 'webgen/puppet_controller'
require_relative 'webgen/vagrant_controller'

class WebGen
  #set up environment variables
  webgenConfig = 'location'
  #display webgen ascii art to console, because if theres no ascii art then it isnt really a project.
  text = File.open('../resources/webgen_ascii.txt').read
  text.each_line do  |line|
    puts line
  end

  #make sure config locations exist, if one of them doesnt exist, exit program.
  puts 'looking for webgen config in: ' + webgenConfig
  if File.exist?(webgenConfig)
    puts 'Config exists'
  end


end