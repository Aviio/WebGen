require_relative '../../lib/helpers/xml_helper'
require_relative '../../lib/validators/config_validator'
require_relative '../../lib/helpers/output_helper'
require_relative 'site_randomizer'
class WebgenEngine
  def initialize(xml_helper, config_validator, output_helper, site_randomizer)
    @xml_helper = xml_helper
    @config_validator = config_validator
    @output_helper = output_helper
    @site_randomizer = site_randomizer
  end
  public
  #Generate a vulnerable web application based on the sites configuration
  def generate(config_locations)

    config_locations_are_valid = @config_validator.validate_config_locations(config_locations)
    unless config_locations_are_valid

      #exit gracefully
    end

    sites_hash = @xml_helper.xml_to_hash(config_locations[:sites])
    template_definitions_hash = @xml_helper.xml_to_hash(config_locations[:templateDefinitions])
    vulnerability_definitions_hash = @xml_helper.xml_to_hash(config_locations[:vulnerabilityDefinitions])
    webgen_config_hash = @xml_helper.xml_to_hash(config_locations[:webgenConfig])
    #todo: split this out into a hash analyzer
    puts webgen_config_hash
    puts 'ping'
    if webgen_config_hash['randomized'][0] == 'true'
      puts 'Generating randomly vulnerable site'
      @site_randomizer.generate_random(template_definitions_hash, vulnerability_definitions_hash)
    else
     @output_helper.count_sites(sites_hash)
      generate_specified(sites_hash)
      #for each site in sites, generate a specified site
    end
  end

  private
  #todo: split this out into random site creator
  #Generate a randomized web application


  #Generate a web application against a site hash
  def generate_specified(site)
    puts site
    #get information from the specification hash and output to console
    #todo: split this out into helper class
    template_id = site['templateId']
    description = site['description']
    vulnerabilities = site['vulnerabilities']
    puts 'Generating vulnerable web app with the following specification:'
    puts "Template ID: #{template_id}"
    puts "Description: #{description}"
  end
end