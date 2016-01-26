# Wrapper class for webgen, allows a user to generate a randomised vulnerable website using command line arguments
# This should be as lightweight as possible to aid integration to SecGen
require_relative 'core/webgen_engine'
require_relative 'helpers/file_system_helper'

class WebGen

  ROOT_DIR = File.dirname(__FILE__)
  #system configuration constant - there should always be one in BaseDir/config/webGenConfig.xml
  WEBGEN_CONFIG_LOCATION = "#{ROOT_DIR}/config/webGenConfig.xml"
  TEMPLATE_DEFINITIONS_LOCATION = "#{ROOT_DIR}/config/templateDefinitions.xml"
  VULNERABILITY_DEFINITIONS_LOCATION = "#{ROOT_DIR}/config/vulnerabilityDefinitions.xml"
  CONFIG_LOCATIONS = [WEBGEN_CONFIG_LOCATION,
                      TEMPLATE_DEFINITIONS_LOCATION,
                      VULNERABILITY_DEFINITIONS_LOCATION]

  file_system_helper = FileSystemHelper.new
  webgen_engine = WebgenEngine.new

  #display core ascii art to console, because if theres no ascii art then it isnt really a project.
  file_system_helper.output_ascii

  #make sure config locations have configs present
  file_system_helper.check_configs(CONFIG_LOCATIONS)



end