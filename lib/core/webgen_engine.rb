require_relative '../../lib/helpers/xml_helper'
require_relative '../../lib/validators/config_validator'
require_relative '../../lib/helpers/output_helper'
class WebgenEngine
  def initialize
    @xml_helper = XmlHelper.new
    @config_validator = ConfigValidator.new
    @output_helper = OutputHelper.new
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
    if webgen_config_hash['Randomized'][0] == 'true'
      puts 'Generating randomly vulnerable site'
      generate_random(template_definitions_hash, vulnerability_definitions_hash)
    else
     @output_helper.count_sites(sites_hash)
      generate_specified(sites_hash)
      #for each site in sites, generate a specified site
    end
  end

  private
  #Generate a randomized web application
  def generate_random(template_definitions_hash, vulnerability_definitions_hash)

    number_of_templates = template_definitions_hash['Template'].size
    random_number = rand(1..number_of_templates)
    puts random_number
    selected_template = template_definitions_hash['Template'][random_number - 1]
    puts selected_template

    #match the vulnerability id's on that template to ones in vuln defs
    #create site hash
    #pass to generate specified
  end

  #Generate a web application against a site hash
  def generate_specified(site)
    puts site
    #get information from the specification hash and output to console
    #todo: split this out into helper class
    template_id = site[0]['TemplateId']
    description = site[0]['Description']
    vulnerabilities = site[0]['Vulnerabilities']
    puts 'Generating vulnerable web app with the following specification:'
    puts "Template ID: #{template_id}"
    puts "Description: #{description}"
  end
end