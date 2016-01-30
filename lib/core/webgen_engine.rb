require_relative '../../lib/helpers/xml_helper'
class WebgenEngine
  def initialize
    @xml_helper = XmlHelper.new
  end
  public
  #Generate a vulnerable web application based on the sites configuration
  def generate(config_locations)
    #todo: validate that these exist
    sites_hash = @xml_helper.xml_to_hash(config_locations[:sites])
    template_definitions_hash = @xml_helper.xml_to_hash(config_locations[:templateDefinitions])
    vulnerability_definitions_hash = @xml_helper.xml_to_hash(config_locations[:vulnerabilityDefinitions])

    #todo: split this out into a hash analyzer
    number_of_sites = sites_hash.size
    if number_of_sites == 1
      puts "There is #{number_of_sites} site defined in the sites config"
    else
      puts "There are #{number_of_sites} sites defined in the sites config"
    end

    if sites_hash.size == 0
      generate_random(template_definitions_hash, vulnerability_definitions_hash)
    else
      #foreach site in sites, generate specified
      generate_specified(sites_hash.values[0])
    end
  end

  private
  #Generate a randomized web application
  def generate_random(template_definitions_hash, vulnerability_definitions_hash)
    puts 'Generating randomly vulnerable site'
    #select a random template from template defs
    #match the vulnerability id's on that template to ones in vuln defs
    #create site hash
    #pass to generate specified
  end

  #Generate a web application against a specification
  def generate_specified(specification)
    puts specification
    #get information from the specification hash and output to console
    #todo: split this out into helper class
    template_id = specification[0]['TemplateId']
    description = specification[0]['Description']
    vulnerabilities = specification[0]['Vulnerabilities']
    puts 'Generating vulnerable web app with the following specification:'
    puts "Template ID: #{template_id}"
    puts "Description: #{description}"
  end
end