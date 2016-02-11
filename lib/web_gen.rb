# Wrapper class for webgen, allows a user to generate a randomised vulnerable website using command line arguments
# This should be as lightweight as possible to aid integration to SecGen
require_relative 'core/webgen_engine'
require_relative 'core/site_randomizer'
require_relative 'helpers/output_helper'

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
  #for dependency injection
  output_helper = OutputHelper.new
  xml_helper = XmlHelper.new
  config_validator = ConfigValidator.new(output_helper)
  site_randomizer = SiteRandomizer.new
  #end dependency injection

  webgen_engine = WebgenEngine.new(xml_helper, config_validator, output_helper, site_randomizer)
  #display core ascii art to console, because if theres no ascii art then it isnt really a project.
  output_helper.output_ascii
  webgen_engine.generate(CONFIG_LOCATIONS)

end