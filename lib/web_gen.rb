# Wrapper class for webgen, allows a user to generate a randomised vulnerable website using command line arguments
require_relative 'webgen/xml_reader'
require_relative 'webgen/webgen_engine'
require_relative 'webgen/file_system_helper'

class WebGen
  #set up environment variables
  webgenConfig = 'location'
  file_system_helper = FileSystemHelper.new
  #display webgen ascii art to console, because if theres no ascii art then it isnt really a project.
  file_system_helper.OutputAscii

  #make sure config locations have configs present

  #load configs into memory

  #run config through webgen engine


end