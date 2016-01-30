# Wrapper class for webgen, allows a user to generate a randomised vulnerable website using command line arguments
# This should be as lightweight as possible to aid integration to SecGen
require_relative 'core/webgen_engine'
require_relative 'helpers/file_system_helper'

class WebGen

  ROOT_DIR = File.dirname(__FILE__)
  #system configuration constant - there should always be one in BaseDir/config/webGenConfig.xml
  WEBGEN_CONFIG_LOCATION = "#{ROOT_DIR}/config/webGenConfig.xml"
  TEMPLATE_DEFINITIONS_LOCATION = "#{ROOT_DIR}/config/templateDefinitions.xml"
  VULN_DEFINITIONS_LOCATION = "#{ROOT_DIR}/config/vulnerabilityDefinitions.xml"
  SITES_LOCATION = "#{ROOT_DIR}/config/sites.xml"

  #config location hash to pass to engine
  CONFIG_LOCATIONS = {
      :webgenConfig => WEBGEN_CONFIG_LOCATION,
      :templateDefinitions => TEMPLATE_DEFINITIONS_LOCATION,
      :vulnerabilityDefinitions => VULN_DEFINITIONS_LOCATION,
      :sites => SITES_LOCATION
  }

  file_system_helper = FileSystemHelper.new
  webgen_engine = WebgenEngine.new
  #display core ascii art to console, because if theres no ascii art then it isnt really a project.
  file_system_helper.output_ascii
  puts 'Checking WebGen Configurations:'
  #make sure config locations have configs present
  file_system_helper.check_configs(CONFIG_LOCATIONS)
  puts
  puts '---------------------------------'
  puts

  webgen_engine.generate(CONFIG_LOCATIONS)

end